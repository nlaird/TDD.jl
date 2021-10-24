using Test
using TDD

@testset "graph.jl" begin
        graph = [[1,2,3], 
                [2,1],
                [3,1],
                [4,5],
                [5,4]]
    
        @test TDD.direct_neighbors(graph, 1) == [1,2,3]
        @test TDD.reachable(graph, 1) == [1,2,3]
        @test TDD.conn_comp(graph) == [[1,2,3],[4,5]]#2 connected sections

        #test if we get back self-connectivity even if the user doesn't specify it
        graph = [[2,3], 
                [1],
                [1],
                [5],
                [4]]
        @test TDD.direct_neighbors(graph, 1) == [1,2,3]
        @test TDD.reachable(graph, 1) == [1,2,3]
        @test TDD.conn_comp(graph) == [[1,2,3],[4,5]]#2 connected sections

        graph = [[2,3], 
                [1],
                [1],
                [5],
                [4],
                []]
        @test TDD.direct_neighbors(graph, 6) == [6]
        @test TDD.reachable(graph, 1) == [1,2,3]
        @test TDD.reachable(graph, 6) == [6]
        @test TDD.conn_comp(graph) == [[1,2,3],[4,5],[6]]#2 connected sections

        graph = [[1,2,3], 
                [2,1,4],
                [3,1],
                [4,5],
                [5,4]]
        @test TDD.reachable(graph, 3) == [3,1,2,4,5]
        @test TDD.conn_comp(graph) == [[1,2,4,5,3]]#everything is connected

        graph = Bool[ 
                1 1 1 0 0
                1 1 0 0 0
                1 0 1 0 0
                0 0 0 1 1
                0 0 0 1 1]
        @test TDD.direct_neighbors(graph, 1) == [1,2,3]
        @test TDD.reachable(graph, 1) == [1,2,3]
        @test TDD.conn_comp(graph) == [[1,2,3],[4,5]]#2 connected sections 

        graph = Bool[ 
                0 1 1 0 0
                1 0 0 0 0
                1 0 0 0 0
                0 0 0 0 1
                0 0 0 1 0]
        @test TDD.direct_neighbors(graph, 1) == [1,2,3]
        @test TDD.reachable(graph, 1) == [1,2,3]
        @test TDD.conn_comp(graph) == [[1,2,3],[4,5]]#2 connected sections 

        graph = Bool[ 
                0 1 1 0 0 0
                1 0 0 0 0 0
                1 0 0 0 0 0
                0 0 0 0 1 0
                0 0 0 1 0 0
                0 0 0 0 0 0]
        @test TDD.direct_neighbors(graph, 6) == [6]
        @test TDD.reachable(graph, 1) == [1,2,3]
        @test TDD.reachable(graph, 6) == [6]
        @test TDD.conn_comp(graph) == [[1,2,3],[4,5],[6]]#2 connected sections
end