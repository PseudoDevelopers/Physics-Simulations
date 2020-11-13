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
    json = "["
    for obj in data
        mass, radius, position, velocity = obj.mass, obj.radius, obj.position, obj.velocity
        
        json *= """
            "mass":  $mass,
            "raduis": $radius,
            "position": $position,
            "velocity": $velocity
        """
    end

    json *= "]"

    document = Mongoc.BSON()
    document["nodes"] = json
    push!(collection, document)
end

function connectToDB()
    global client = Mongoc.Client("localhost", 27017)
    global database = client[dbName]
    global collection = database[collectionName]
end

export connectToDB, insertToDB
end
