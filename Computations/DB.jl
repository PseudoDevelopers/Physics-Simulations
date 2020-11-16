module DB
import Mongoc
import BSON
include("Initial.jl")
using .Initial
include("Node.jl")
using .Node

dbName = "Physics-Simulation"
client = nothing
database = nothing
collection = nothing


function insertToDB(data, id=nothing)
    document = juliaStructToBSON(data, id)    
    
    push!(collection, document)
end

function connectToDB()
    global client = Mongoc.Client("localhost", 27017)
    global database = client[dbName]
    global collection = database[collectionName]
end


function juliaStructToBSON(data, id)
    json = ""

    for obj in data
        mass, radius, position, velocity = obj.mass, obj.radius, obj.position, obj.velocity

        json *= """{
            "mass":  $mass,
            "raduis": $radius,
            "position": $position,
            "velocity": $velocity
        },"""
    end

    if id ≠ nothing
        return Mongoc.BSON("""{
            "node": [""" * json[1:end - 1] * """],
            "_id": $id
        }""")
    else
        return Mongoc.BSON("{\"node\": [" * json[1:end - 1] * "]}")
    end
end

export connectToDB, insertToDB
end
