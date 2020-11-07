include("./Initial.jl")
using .Initial
include("./Frame.jl")
using .Frame


time = tick
const frames = [frame(1, deepcopy(nodes))]


function startCalculations()
    for i in 2:totalTicks
        calculateFrame(nodes)
        push!(frames, frame(i, deepcopy(nodes)))
    end

    println(frames)
end


startCalculations()
