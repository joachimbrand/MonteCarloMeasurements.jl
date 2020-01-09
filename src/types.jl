const ConcreteFloat = Union{Float64,Float32,Float16,BigFloat}
const ConcreteInt = Union{Bool,Int8,Int16,Int32,Int64,Int128,BigInt}

abstract type AbstractParticles{T,N} <: Real end
"""
    struct Particles{T, N} <: AbstractParticles{T, N}

This type represents uncertainty using a cloud of particles.
# Constructors:
- `Particles()`
- `Particles(N::Integer)`
- `Particles(d::Distribution)`
- `Particles(N::Integer, d::Distribution; permute=true, systematic=true)`
- `Particles(v::Vector{T} where T)`
- `Particles(m::Matrix{T} where T)`: Creates multivariate particles (Vector{Particles})
"""
struct Particles{T,N} <: AbstractParticles{T,N}
    particles::Vector{T}
end

"""
    struct StaticParticles{T, N} <: AbstractParticles{T, N}

See `?Particles` for help. The difference between `StaticParticles` and `Particles` is that the `StaticParticles` store particles in a static vecetor. This makes runtimes much shorter, but compile times longer. See the documentation for some benchmarks.
"""
struct StaticParticles{T,N} <: AbstractParticles{T,N}
    particles::SArray{Tuple{N}, T, 1, N}
end




const MvParticles = Vector{<:AbstractParticles} # This can not be AbstractVector since it causes some methods below to be less specific than desired