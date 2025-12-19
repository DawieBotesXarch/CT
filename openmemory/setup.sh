#!/bin/bash
# OpenMemory Setup Script
# This script clones the OpenMemory repository and builds the container

set -e  # Exit on error

echo "🚀 OpenMemory Setup Script"
echo "=========================="
echo ""

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Error: Docker is not running"
    echo "Please start Docker and try again"
    exit 1
fi

# Clone OpenMemory if not already present
if [ ! -d "temp-build" ]; then
    echo "📥 Cloning OpenMemory repository..."
    git clone --depth 1 https://github.com/CaviraOSS/OpenMemory.git temp-build
    echo "✅ Repository cloned"
else
    echo "ℹ️  Repository already exists, skipping clone"
fi

# Build and start the container
echo ""
echo "🏗️  Building and starting OpenMemory container..."
docker compose up -d --build

# Wait for health check
echo ""
echo "⏳ Waiting for OpenMemory to be healthy..."
for i in {1..30}; do
    if docker inspect --format='{{.State.Health.Status}}' openmemory-ct2 2>/dev/null | grep -q "healthy"; then
        echo "✅ OpenMemory is healthy!"
        break
    fi

    if [ $i -eq 30 ]; then
        echo "⚠️  Timeout waiting for health check"
        echo "Run 'docker logs openmemory-ct2' to see what's wrong"
        exit 1
    fi

    echo "   Waiting... ($i/30)"
    sleep 2
done

# Test the API
echo ""
echo "🧪 Testing API..."
if curl -s http://localhost:8080/health > /dev/null; then
    echo "✅ API is responding"
    echo ""
    echo "🎉 Setup complete!"
    echo ""
    echo "OpenMemory is now running on http://localhost:8080"
    echo ""
    echo "Next steps:"
    echo "1. Restart Claude Code in this project directory"
    echo "2. OpenMemory tools will be available via the openmemory MCP server"
    echo ""
    echo "Useful commands:"
    echo "  - View logs: docker logs -f openmemory-ct2"
    echo "  - Stop: docker compose down"
    echo "  - Restart: docker compose restart"
else
    echo "❌ API is not responding"
    echo "Run 'docker logs openmemory-ct2' to see what's wrong"
    exit 1
fi
