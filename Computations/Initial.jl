module Initial

include("./Node.jl")
using .Node


const tick = 0.1        # Single time tick (Seconds)
const totalTicks = 10   # Total calculation frams
# framesPerSecond = 1

# All the nodes
nodes = [
    node(1E20, [0, 0], [0.1, 0]),
    node(1E20, [1, 1], [0.1, 0]),
    node(1E20, [3, 4], [0.1, 0]),
    node(1E20, [0, 7], [0.1, 0])
]

export nodes, tick, totalTicks
end
