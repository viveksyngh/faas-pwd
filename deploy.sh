#!/bin/bash

# Go one step back from the current directory
cd ..

# Clone OpenFaaS repository 
echo "Cloning OpenFaaS repository"
git clone https://github.com/openfaas/faas

# Move to faas directory
cd faas

# Deploy the stack
echo "Deploying the stack"
./deploy.sh
echo "Stack Deployed"


# Create grafana service to visualize function metrics
echo "Creating grafana service"
docker service create -d \
    --name=grafana \
    --publish=3000:3000 \
    --network=func_functions \
    stefanprodan/faas-grafana:4.6.3
echo "Created grafana service"

# Install FaaS CLI
echo "Installing faas CLI"
curl -sSL https://cli.openfaas.com | sudo sh
echo "Installed faas CLI"

