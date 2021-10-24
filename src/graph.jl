function direct_neighbors(graph, node)
    neighbors = graph[node]
    if node ∉ neighbors
        pushfirst!(neighbors, node)
    end
    return neighbors
end