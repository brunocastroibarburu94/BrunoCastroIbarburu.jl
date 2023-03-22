run:
	julia --project=./ ./jumpstart_src/main.jl 

julia:
	julia --project=./

test:
	julia --project=./ ./jumpstart_src/main.jl

sync:
	julia --project=./ -e 'using Pkg; Pkg.instantiate()'

pluto:
	julia --project=./ ./jumpstart_src/launch_pluto.jl

setgit:
	git config --global user.email ${GITHUB_EMAIL}
	git config --global user.name ${GITHUB_NAME}