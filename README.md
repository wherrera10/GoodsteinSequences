# Goodstein Sequences
Julia module for Goodstein sequences, integer sequences introduced in 1944 by Rueben Louis Goodstein
<br />
Exports: 

<span style="color: gold">goodstein(n; limitlength = 10)</span>

This function returns a vector of up to limitlength values of the Goodstein sequence for n.

<br /><br />
<span style="color: gold">A266201(n)</span>

This function returns the Nth term of the Goodstein(n) sequence counting from 0.

Helper functions:

<span style="color: gold">hereditary_representation</span>

Given nonnegative integer n and base b, return hereditary representation consisting of tuples (j, k)
such that the sum of all (j * base^(evaluate(k)) = n. Note that the represenation is a vector of
recursive unions with elements of type Vector{Union{typeof(n), Vector}}.

<span style="color: gold">evaluate</span>

Evaluate the hereditary representation d under base b. In constructing the Goodstein sequence the
hereditary representation d, which was created under base b, is next evaluated under base (b + 1).



