module PhysicsFormulae

using LinearAlgebra
include("./Initial.jl")
using .Initial

const G = 6.67408e-11

# Calcualte the difference in velocities of two nodes due to gravitational force
function acceleration(node1, node2)
    # First we calculate the distance
    displacement = node1.position - node2.position
    distance = sum(square.(displacement))

    dv = normalize(displacement)
    dv = ((G * node2.mass) / square(distance)) .* dv

    return dv
end

# Calcualte the velocities of two nodes after collusion
function bounce(node1, node2)
    m₁, m₂ = node1.mass, node2.mass
    v₁, v₂ = node1.velocity, node2.velocity

    vf₁ = v₁ .* ((m₁ - m₂) / (m₂ + m₁))
    vf₁ += v₂ .* ((2 * m₂) / (m₂ + m₁))

    vf₂ = v₁ .* ((2 * m₁) / (m₂ + m₁))
    vf₂ += v₂ .* ((m₂ - m₁) / (m₂ + m₁))

    return vf₁, vf₂
end

# Calculate the combined velocity of two nodes after collusion
function combinedVelocity(node1, node2)
    m₁, m₂ = node1.mass, node2.mass
    v₁, v₂ = node1.velocity, node2.velocity

    vf = (m₁ .* v₁ + m₂ .* v₂) / (m₁ + m₂)

    return vf
end

function collideIfColliding(node1, node2)
    p₁, p₂ = node1.position, node2.position
    r₁, r₂ = node1.radius, node2.radius

    minDistanceForCollusion = r₁ + r₂
    distanceBetweenNodes = sum(square.(p₁ - p₂))

    if distanceBetweenNodes <= minDistanceForCollusion
        if onCollusion == "bounce"
            bounce(node1, node2)
        else
            combinedVelocity(node1, node2)
        end
    end
end


square(n) = n^2

export acceleration, bounce, combinedVelocity, collideIfColliding
end
