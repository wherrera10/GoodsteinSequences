module GoodsteinSequences

export goodstein, hereditary_representation, evaluate, A266201

""" Given nonnegative integer n and base b, return hereditary representation consisting of
    tuples (j, k) such that the sum of all (j * base^(evaluate(k)) = n.
"""
function hereditary_representation(n, b)
    if n < b
        return n
    end
    decomp = Vector{Union{typeof(n), Vector}}[]
    e = typeof(n)(0)
    while n != 0
        n, r = divrem(n, b)
        if r > 0
            push!(decomp, [r, hereditary_representation(e, b)])
        end
        e += 1
    end
    return decomp
end

""" Evaluate hereditary representation d under base b """
evaluate(d, b) = d isa Integer ? d : sum(j * b ^ evaluate(k, b) for (j, k) in d)

""" Return a vector of up to limitlength values of the Goodstein sequence for n """
function goodstein(n, limitlength = 10)
    seq = typeof(n)[]
    b = typeof(n)(2)
    while length(seq) < limitlength
        push!(seq, n)
        n == 0 && break
        d = hereditary_representation(n, b)
        b += 1
        n = evaluate(d, b) - 1
    end
    return seq
end

"""Get the Nth term of Goodstein(n) sequence counting from 0, see https://oeis.org/A266201"""
A266201(n) = last(goodstein(BigInt(n), n + 1))
 
end # module
