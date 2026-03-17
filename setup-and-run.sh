#!/bin/bash

# Books Management System - Setup & Run Guide

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                 Books Management System Setup                  ║"
echo "║                  Angular Frontend + ASP.NET Backend            ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Step 1: Check Prerequisites${NC}"
echo "================================"
echo ""

# Check Node.js
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    echo -e "${GREEN}✓${NC} Node.js installed: $NODE_VERSION"
else
    echo -e "${RED}✗${NC} Node.js not found. Please install it from https://nodejs.org/"
    exit 1
fi

# Check npm
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm --version)
    echo -e "${GREEN}✓${NC} npm installed: $NPM_VERSION"
else
    echo -e "${RED}✗${NC} npm not found. Please install Node.js"
    exit 1
fi

# Check .NET
if command -v dotnet &> /dev/null; then
    DOTNET_VERSION=$(dotnet --version)
    echo -e "${GREEN}✓${NC} .NET SDK installed: $DOTNET_VERSION"
else
    echo -e "${RED}✗${NC} .NET SDK not found. Please install it from https://dotnet.microsoft.com/download"
    exit 1
fi

echo ""
echo -e "${BLUE}Step 2: Setup Backend (ASP.NET)${NC}"
echo "================================"
cd /Users/maheshianuradha/Downloads/Backend/BooksAPI
echo "Current directory: $(pwd)"
echo ""
echo -e "${YELLOW}Building backend...${NC}"
dotnet build

if [ $? -ne 0 ]; then
    echo -e "${RED}Backend build failed!${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Backend build successful!${NC}"
echo ""
echo -e "${YELLOW}Starting backend API server on https://localhost:5001...${NC}"
echo "You can stop it with Ctrl+C"
echo ""

# Start backend in background
dotnet run &
BACKEND_PID=$!

# Give backend time to start
sleep 5

# Check if backend is running
if kill -0 $BACKEND_PID 2>/dev/null; then
    echo -e "${GREEN}✓ Backend API is running!${NC}"
else
    echo -e "${RED}✗ Backend failed to start${NC}"
    exit 1
fi

echo ""
echo -e "${BLUE}Step 3: Setup Frontend (Angular)${NC}"
echo "================================"
cd /Users/maheshianuradha/Downloads/Frontend/BooksApp
echo "Current directory: $(pwd)"
echo ""
echo -e "${YELLOW}Installing dependencies...${NC}"
npm install

if [ $? -ne 0 ]; then
    echo -e "${RED}npm install failed!${NC}"
    kill $BACKEND_PID
    exit 1
fi

echo -e "${GREEN}✓ Dependencies installed!${NC}"
echo ""
echo -e "${YELLOW}Starting Angular development server...${NC}"
echo "The app will open in your browser at http://localhost:4200"
echo ""

npx ng serve --open

# Cleanup
kill $BACKEND_PID 2>/dev/null
