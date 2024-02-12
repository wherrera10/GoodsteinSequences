# GoodsteinSequences
Julia module for Goodstein sequences, integer sequences introduced in 1944 by Rueben Louis Goodstein

Exports: 

function goodstein(n::T; limitlength = 10) where T <: Integer. This function returns a vector of up to limitlength values of the Goodstein sequence for n.

function A266201(n) = last(goodstein(BigInt(n), limitlength = n + 1)). This function returns the Nth term of the Goodstein(n) sequence counting from 0.



