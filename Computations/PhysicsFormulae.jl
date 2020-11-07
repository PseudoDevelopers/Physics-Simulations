module PhysicsFormulae

using LinearAlgebra
include("./Initial.jl")
using .Initial

const G = 6.67408e-11

function acceleration(node1, node2)
    # First we calculate the distance
    displacement = node1.position - node2.position
    distance = sum(square.(displacement))

    dv = normalize(displacement)
    dv = ((G * node2.mass) / square(distance)).*dv

    return dv
end

square(n) = n * n

export acceleration
end
