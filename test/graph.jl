using Test
using TDD

@testset "graph.jl" begin
        graph = [[1,2,3], 
                [2,1],
                [3,1],
                [4,5],
                [5,4]]
    
        @test TDD.direct_neighbors(graph, 1) == [1,2,3]

        #test if we get back self-connectivity even if the user doesn't specify it
        graph = [[2,3], 
                [1],
                [1],
                [5],
                [4]]
        @test TDD.direct_neighbors(graph, 1) == [1,2,3]

        graph = [[2,3], 
                [1],
                [1],
                [5],
                [4],
                []]
        @test TDD.direct_neighbors(graph, 6) == [6]

        #start #2 of homework
        graph = [[1,2,3], 
                [2,1,4],
                [3,1],
                [4,5],
                [5,4]]
        @test TDD.reachable(graph, 3) == [3,1,2,4,5]

        #start #3 of homework
        @test TDD.conn_comp(graph) == [[1,2,4,5,3]]#everything is connected

        graph = [[1,2,3], 
                [2,1],
                [3,1],
                [4,5],
                [5,4]]
        @test TDD.conn_comp(graph) == [[1,2,3],[4,5]]#2 connected sections

        graph = [[2,3], 
                [1],
                [1],
                [5],
                [4],
                []]
        @test TDD.conn_comp(graph) == [[1,2,3], [4,5], [6]]#one node is not connected to anything

end