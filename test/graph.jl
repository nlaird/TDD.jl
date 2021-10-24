using Test
using TDD

@testset "graph.jl" begin
    graph = [[1,2,3], 
            [2,1],
            [3,1],
            [4,5],
            [5,4]]
    
    @test direct_neighbors(graph, 1) == [1,2,3]
    
    #test if we get back self-connectivity even if the user doesn't specify it
    graph = [[2,3], 
            [1],
            [1],
            [5],
            [4]]
    @test direct_neighbors(graph, 1) == [1,2,3]

    graph = [[2,3], 
            [1],
            [1],
            [5],
            [4],
            []]
    @test direct_neighbors(graph, 6) == [6]

end