using DMUStudent.HW2
using POMDPs: actions
using POMDPModelTools: ordered_states
using Plots

gamma = 0.95

A = actions(grid_world)

T = transition_matrices(grid_world)
R = reward_vectors(grid_world)
Val = rand(length(R[:right])) # this would be a good container to use for your value function
Val_new = zeros(length(R[:right]))
iterant = 0
#=
for k = 1:25
    for i = 1:length(Val)
        value_action = []
        for j in 1:length(A)
            push!(value_action,R[A[j]][i] + gamma*sum(T[A[j]][i,1:101].*Val))
        end
        @show value_action
    global Val[i] = maximum(value_action)
    end
       
end
=#
#=
while any(Val!=Val_new)
    global iterant +=1
    @show iterant
    global Val=copy(Val_new)
    @show isequal(Val,Val_new)
    for i = 1:101
        value_action = []
        for j in 1:length(A)
            push!(value_action,R[A[j]][i] + gamma*sum(T[A[j]][i,1:101].*Val))
        end
        Val_new[i] = maximum(value_action)
    
    end
   @show isequal(Val,Val_new)    
end


gw = display(render(grid_world, color=Val))
savefig(gw,"grid.png")

#=
function get_neighbor(s,l,b)

    neighbor = Dict()

    if (s%l == 1) && (s!=1) && (s!=l*(b-1)+1) # First Colomn
        neighbor[s] = (s+1,s-l,s+l)
    
    else if (s%l == 0) && (s!=l) && s!=(l*b) # Last Colomn
        neighbor[s] = (s-1,s-l,s+l)
    
    else if s <= l && s!=l && s!=l # First Row
        neighbor[s] = (s-1,s+1,s+l)
    
    else if (s > l*(b-1)) && (s!=l*(b-1)+1) && (s!=l*b) # Last Row
        neighbor[s] = (s-1,s+1,s-l)
    
    else
        neighbor[s] = (s-1,s+1,s-10,s+10)       # Remaining grid
         
end

(l,b) = grid_world.size

V = zero(length(R[:right]))

iterate actions

than get the max

=#
=#