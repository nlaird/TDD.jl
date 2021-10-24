function direct_neighbors(graph, node)
    neighbors = graph[node]
    if node ∉ neighbors
        pushfirst!(neighbors, node)
    end
    return neighbors
end

function reachable(graph, node)
    return dfs([], graph, node)
end

function dfs(visited, graph, node)
    if node ∉ visited
        push!(visited, node)
        for neighbor in TDD.direct_neighbors(graph, node)
            dfs(visited, graph, neighbor)
        end
    end
    return visited
end

function conn_comp(graph)
    comps = Array{Int}[]
    for node in collect(1:length(graph))
        println(stdout, node, comps)
        if length(comps)<1
            push!(comps, reachable(graph, node))
        elseif  sum(map(x->node in x, comps)) < 1  #if node has not be found/added to a connection yet
            push!(comps, reachable(graph, node))
        end
    end
    return comps
end