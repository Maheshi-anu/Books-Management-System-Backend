#!/bin/bash

# Quick Start Guide for Books API Backend

echo "======================================"
echo "Books API - Backend Quick Start"
echo "======================================"
echo ""
echo "Prerequisites:"
echo "✓ .NET SDK 10.0 or higher installed"
echo "✓ You are in the BooksAPI directory"
echo ""

# Check if dotnet is installed
if ! command -v dotnet &> /dev/null; then
    echo "❌ .NET SDK is not installed. Please install it first."
    echo "   Visit: https://dotnet.microsoft.com/download"
    exit 1
fi

dotnetVersion=$(dotnet --version)
echo "✓ Found .NET SDK: $dotnetVersion"
echo ""

# Build the project
echo "Building the project..."
dotnet build

if [ $? -ne 0 ]; then
    echo "❌ Build failed. Please check your code."
    exit 1
fi

echo ""
echo "✓ Build successful!"
echo ""

# Run the project
echo "Starting the API server..."
echo ""
echo "The API will be available at:"
echo "  🔗 https://localhost:5001/api/books"
echo ""
echo "To stop the server, press Ctrl+C"
echo ""

dotnet run
