#!/bin/bash

# Set Variables

REPO_URL="https://github.com/Ramasamy3488/Dockerdev.git"
APP_DIR="/home/ram/app"
DOCKER_IMAGE="testimage:v1"
DOCKER_CONTAINER="testcon"


echo "Starting deployment process..."

# Step 1: Navigate to the Application Directory
cd $APP_DIR || { echo "Failed to access $APP_DIR"; exit 1; }

# Step 2: Pull the Latest Code from Git
echo "Pulling latest changes from Git..."
git clone $REPO_URL || { echo "Git pull failed"; exit 2; }

# Step 3: Build the Docker Image
echo "Building Docker image..."
docker build -t $DOCKER_IMAGE Dockerdev || { echo "Docker build failed"; exit 3; }

# Step 4: Stop and Remove the Existing Container
echo "Stopping and removing old container..."
docker stop $DOCKER_CONTAINER || echo "Container not running"
docker rm $DOCKER_CONTAINER || echo "No existing container to remove"

# Step 5: Run the New Container
echo "Starting new container..."
docker run -d --name $DOCKER_CONTAINER -p 8081:80 $DOCKER_IMAGE || { echo "Failed to start container"; exit 4; }

echo "Deployment successful!"
