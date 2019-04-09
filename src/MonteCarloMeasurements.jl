module MonteCarloMeasurements

export Particles,StaticParticles, ≲


using LinearAlgebra, Statistics, Random, StaticArrays, Reexport, RecipesBase
import StatsFuns
using Lazy: @forward

@reexport using Distributions

include("particles.jl")
end


# TODO: Mutation, test on ControlSystems
# TODO: InplaceParticles: maintains an output workspace
# struct InplaceParticles
#     particles::Vector
#     output::ImmutableVector
# end
# This output should ideally be some kind of immutable vector since it could be unsafe to mutate it. Unclear how the map!(f, output, particles) would be done if output is immutable though.
