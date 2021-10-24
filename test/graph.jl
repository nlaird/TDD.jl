using Test
using TDD

@testset "graph.jl" begin
    graph = [
            [1,2,3], 
            [2,1],
            [3,1],
            [4,5],
            [5,4]]

    @test direct_neighbors(graph, 1) == [1,2,3] 

end