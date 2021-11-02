using Test
using TDD

@testset "interval.jl" begin
    iv = TDD.Interval(1,32)
    @test minimum(iv) == 1
    @test maximum(iv) == 32
    @test (4 in iv) == true
    @test (40 in iv) == false
    @test (-1.5 in iv) == false
    @test isempty(iv) == false
    @test issubset([1,2,3], iv) == true
    @test issubset([1,2,3,40], iv) == false
    @test issubset([], iv) == true
    @test issubset(1:32, iv) == true
    @test intersect([1,2,3], iv) == [1,2,3]
    @test intersect([40], iv) == []
    @test intersect([], iv) == []
    @test show(iv) == "\u301a1:32\u301b"
    

    iv = TDD.Interval()
    @test isempty(iv) == true
    @test minimum(iv) === nothing
    @test maximum(iv) === nothing
    @test (4 in iv) == false
    @test issubset([], iv) == true
    @test issubset(1:32, iv) == false
    @test intersect([1,2,3], iv) == []
    @test intersect([], iv) == []
    @test show(iv) == "∅"

end