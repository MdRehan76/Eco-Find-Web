#!/bin/bash

# EcoFinds Deployment Script for Vercel

echo "🌱 EcoFinds Deployment Script"
echo "=============================="

# Check if Vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "❌ Vercel CLI not found. Installing..."
    npm install -g vercel
fi

# Check if user is logged in to Vercel
if ! vercel whoami &> /dev/null; then
    echo "🔐 Please log in to Vercel:"
    vercel login
fi

echo "📦 Building the application..."

# Install dependencies
echo "Installing root dependencies..."
npm install

echo "Installing client dependencies..."
cd client && npm install && cd ..

echo "Installing API dependencies..."
cd api && npm install && cd ..

# Build the client
echo "Building React app..."
cd client && npm run build && cd ..

echo "🚀 Deploying to Vercel..."

# Deploy to Vercel
vercel --prod

echo "✅ Deployment complete!"
echo ""
echo "🌐 Your app should be available at the URL provided above."
echo "📊 Check your Vercel dashboard for deployment details."
echo ""
echo "🔧 Don't forget to set these environment variables in Vercel:"
echo "   - JWT_SECRET=your-super-secret-jwt-key"
echo "   - NODE_ENV=production"
echo "   - CLIENT_URL=https://your-app.vercel.app"
echo ""
echo "🎉 Happy coding with EcoFinds!"
