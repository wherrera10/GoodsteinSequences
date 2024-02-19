# Goodstein Sequences
Julia module for Goodstein sequences, integer sequences introduced in 1944 by Rueben Louis Goodstein
<br />
Exports: 

$\color{gold}{\textrm{ goodstein(n; limitlength = 10)}}$

This function returns a vector of up to limitlength values of the Goodstein sequence for n.

<br /><br />
$\color{gold}{\textrm{ A266201(n)}}$

This function returns the Nth term of the Goodstein(n) sequence counting from 0.

Helper functions:

$\color{gold}{\textrm{hereditary_representation(n, b)}}$

Given nonnegative integer n and base b, return hereditary representation consisting of tuples (j, k)
such that the sum of all (j * base^(evaluate(k)) = n. Note that the represenation is a vector of
recursive unions with elements of type Vector{Union{typeof(n), Vector}}.

$\color{gold}{\textrm{evaluate(d, b)}}$

Evaluate the hereditary representation d under base b. In constructing the Goodstein sequence the
hereditary representation d, which was created under base b, is next evaluated under base (b + 1).



