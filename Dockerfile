FROM julia:1.8.5-bullseye

# Install updates
RUN apt-get update

# Install make
RUN apt-get -y install make

# Set work directory
WORKDIR "/root/project"

# Get Packages requirements
# Replace manifest and project tomls with the ones in project 
# (this will allow to pre-download all packages from them) 
COPY ./project/Project.toml /root/.julia/environments/v1.8/Project.toml
COPY ./project/Manifest.toml /root/.julia/environments/v1.8/Manifest.toml

# Pre-download Packages into Image
RUN julia -e 'using Pkg; Pkg.instantiate()'