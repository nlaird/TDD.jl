using Test
using TDD

@testset "interval.jl" begin
    iv = TDD.Interval(1,32)
    @test TDD.minimum(iv) == 1
    @test TDD.maximum(iv) == 32

end