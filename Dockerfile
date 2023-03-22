FROM julia:1.8.5-bullseye

# Install updates
RUN apt-get update

# Install make
RUN apt-get -y install make git

# Set work directory
WORKDIR "/root/project"

# Get Packages requirements for developing environment and embedd in image 
COPY ./dev_project/Project.toml /root/.julia/environments/v1.8/Project.toml
COPY ./dev_project/Manifest.toml /root/.julia/environments/v1.8/Manifest.toml

# Pre-download Packages into Image
RUN julia -e 'using Pkg; Pkg.instantiate()'