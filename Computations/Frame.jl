module Frame

include("./Initial.jl")
using .Initial
include("./PhysicsFormulae.jl")
using .PhysicsFormulae

struct frame
    frameNo
    nodes
end

function calculateFrame(nodes)
    totalNodes = size(nodes)[1]
    
    calculateAllAccelerations(nodes, totalNodes)
    for i in 1:totalNodes
        nodes[i].position += nodes[i].velocity .* tick
    end
end


function calculateAllAccelerations(nodes, totalNodes)
    for i in 1:totalNodes, j in 1:totalNodes
        if i == j
            continue
        end
        dv = acceleration(nodes[i], nodes[j])
        nodes[i].velocity += dv
    end
end

export frame, calculateFrame
end
