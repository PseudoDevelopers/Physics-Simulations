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
    dv = ((G * node2.mass) / square(distance)) .* dv

    return dv
end

function bounce(node1, node2)
    m₁, m₂ = node1.mass, node2.mass
    v₁, v₂ = node1.velocity, node2.velocity
    
    vf₁ = v₁ .* ((m₁ - m₂) / (m₂ + m₁))
    vf₁ += v₂ .* ((2 * m₂) / (m₂ + m₁))

    vf₂ = v₁ .* ((2 * m₁) / (m₂ + m₁))
    vf₂ += v₂ .* ((m₂ - m₁) / (m₂ + m₁))

    return vf₁, vf₂
end

square(n) = n^2

export acceleration
end
