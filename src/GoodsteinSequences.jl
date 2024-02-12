module GoodsteinSequences

export goodstein, A266201

mutable struct GBase{T<:Integer}
    b::T
end

abstract type HereditaryRepresentation end

struct HRTuple <: HereditaryRepresentation
    mult::BigInt
    exp::GBase
end

struct HRVector <: HereditaryRepresentation
    mult::BigInt
    exp::Vector{HereditaryRepresentation}
end

""" given integer n and base b, return tuples (j, k) so sum of all (j * base^(evaluate(k)) = n. """
function decompose(n::T, bas::GBase) where T <: Integer
    e = T(0)
    decomp = HereditaryRepresentation[]
    while n != 0
        n, r = divrem(n, bas.b)
        if r != 0 && e >= bas.b
            if e > bas.b
                push!(decomp, HRVector(r, decompose(e, bas)))
            elseif e == bas.b
                push!(decomp, HRTuple(r, bas))
            end
        else
            push!(decomp, HRTuple(r, GBase(e)))
        end
        e += 1
    end
    return decomp
end

evaluate(i::Integer, _) = i
evaluate(bas::GBase, _) = bas.b
evaluate(t::HRTuple, bas) = t.mult * (bas.b)^(evaluate(t.exp, bas))
evaluate(hv::HRVector, bas) = hv.mult * bas.b^evaluate(hv.exp, bas)
evaluate(arr::Vector{HereditaryRepresentation}, bas) = isempty(arr) ? 0 : sum(evaluate(a, bas) for a in arr)

""" Return a vector of up to limitlength values of the Goodstein sequence for n """
function goodstein(n::T; limitlength = 10) where T <: Integer
    sequence = T[]
    bas = GBase(T(2))
    while n >= 0 && length(sequence) < limitlength
        push!(sequence, n)
        d = decompose(n, bas)
        bas.b += 1 # Since bas is a reference in d this increments all GBase subcomponents of d
        n = evaluate(d, bas) - 1
    end
    return sequence
end

""" Get the Nth term of Goodstein(n) sequence counting from 0, see https://oeis.org/A266201 """
A266201(n) = last(goodstein(BigInt(n), limitlength = n + 1))
 
end # module

