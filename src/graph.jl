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