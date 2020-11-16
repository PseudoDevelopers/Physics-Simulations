@time begin

include("./Initial.jl")
using .Initial
include("./Frame.jl")
using .Frame
include("./DB.jl")
using .DB


time = tick
const frames = [frame(1, deepcopy(nodes))]


function startCalculations()
    insertToDB(deepcopy(nodes), 1)
    for i in 2:totalTicks
        calculateFrame(nodes)
        # push!(frames, frame(i, deepcopy(nodes)))
        insertToDB(deepcopy(nodes), i)

        println("$i frames calculated")
    end
end


connectToDB()
startCalculations()

end
