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

    @test isempty(TDD.Interval()) == true
end