#!/bin/bash

set -e  # Exit on error

echo "Building backend images..."
docker build -f Dockerfile.backend -t simple-backend .

echo "Starting services with Docker Compose..."
docker-compose up -d

echo "Waiting for services to start..."
sleep 5

echo "Testing load balancer (hit Ctrl+C to stop)..."
while true; do
  curl http://localhost:8080
  echo ""  # Newline for readability
  sleep 1
done