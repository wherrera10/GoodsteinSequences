using GoodsteinSequences
using Test

@test goodstein(0) ==  [0]
@test goodstein(1) == [1, 0]
@test goodstein(2) == [2, 2, 1, 0]
@test goodstein(3) == [3, 3, 3, 2, 1, 0]
@test goodstein(7) == [7, 30, 259, 3127, 46657, 823543, 16777215, 37665879, 77777775, 150051213]
@test A266201(15) == 14063084452070776884879
