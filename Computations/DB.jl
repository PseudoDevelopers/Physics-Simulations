module DB
import Mongoc
import BSON
include("Initial.jl")
using .Initial

dbName = "Physics-Simulation"
client = nothing
database = nothing
collection = nothing


function insertToDB(data)
    json = Array{Mongoc.BSON,1}(undef, length(data))

    for (i, obj) in enumerate(data)
        mass, radius, position, velocity = obj.mass, obj.radius, obj.position, obj.velocity

        json[i] = Mongoc.BSON("""{
            "mass":  $mass,
            "raduis": $radius,
            "position": $position,
            "velocity": $velocity
        }""")
    end

    append!(collection, json)
end

function connectToDB()
    global client = Mongoc.Client("localhost", 27017)
    global database = client[dbName]
    global collection = database[collectionName]
end

export connectToDB, insertToDB
end
