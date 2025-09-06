# EcoFinds - Vercel Deployment Guide

This guide will help you deploy the EcoFinds application to Vercel.

## 🚀 Quick Deployment

### Prerequisites
- Vercel account (free at [vercel.com](https://vercel.com))
- GitHub account
- Node.js installed locally (for testing)

### Step 1: Prepare Your Repository

1. **Push your code to GitHub**
   ```bash
   git add .
   git commit -m "Initial EcoFinds deployment"
   git push origin main
   ```

### Step 2: Deploy to Vercel

1. **Go to [vercel.com](https://vercel.com) and sign in**

2. **Click "New Project"**

3. **Import your GitHub repository**
   - Select your EcoFinds repository
   - Click "Import"

4. **Configure the project**
   - **Framework Preset**: Other
   - **Root Directory**: Leave as default (./)
   - **Build Command**: `cd client && npm run build`
   - **Output Directory**: `client/build`

5. **Set Environment Variables**
   Click "Environment Variables" and add:
   ```
   JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
   NODE_ENV=production
   CLIENT_URL=https://your-app-name.vercel.app
   ```

6. **Deploy**
   - Click "Deploy"
   - Wait for the build to complete (2-3 minutes)

### Step 3: Verify Deployment

1. **Check your app URL** (provided by Vercel)
2. **Test the API**: Visit `https://your-app.vercel.app/api/health`
3. **Test the frontend**: Visit `https://your-app.vercel.app`

## 🔧 Environment Variables

Set these in your Vercel dashboard:

| Variable | Value | Description |
|----------|-------|-------------|
| `JWT_SECRET` | `your-secret-key` | Secret for JWT token signing |
| `NODE_ENV` | `production` | Environment mode |
| `CLIENT_URL` | `https://your-app.vercel.app` | Your app's URL |

## 📁 Project Structure for Vercel

```
ecofinds/
├── api/                    # Serverless functions
│   ├── index.js           # Main API handler
│   ├── auth.js            # Authentication routes
│   ├── products.js        # Product routes
│   ├── orders.js          # Order routes
│   ├── cart.js            # Cart routes
│   ├── messages.js        # Message routes
│   ├── users.js           # User routes
│   ├── database.js        # Database connection
│   └── middleware/        # Auth middleware
├── client/                # React frontend
│   ├── src/               # Source code
│   ├── public/            # Static files
│   └── package.json       # Dependencies
├── db/                    # Database files
│   ├── schema.sql         # Database schema
│   └── seed.sql          # Sample data
├── vercel.json           # Vercel configuration
└── package.json          # Root dependencies
```

## 🛠️ Troubleshooting

### Common Issues

1. **Build Fails**
   - Check that all dependencies are in `package.json`
   - Ensure Node.js version is compatible
   - Check build logs in Vercel dashboard

2. **API Routes Not Working**
   - Verify `vercel.json` configuration
   - Check that API files are in the `api/` directory
   - Ensure routes are properly exported

3. **Database Issues**
   - SQLite database is created automatically
   - Check that database files are accessible
   - Verify database initialization in `database.js`

4. **CORS Errors**
   - Update `CLIENT_URL` environment variable
   - Check CORS configuration in `api/index.js`

### Debugging

1. **Check Vercel Function Logs**
   - Go to your project dashboard
   - Click "Functions" tab
   - View logs for each API route

2. **Test API Endpoints**
   ```bash
   curl https://your-app.vercel.app/api/health
   curl https://your-app.vercel.app/api/products
   ```

3. **Check Build Logs**
   - Go to "Deployments" tab
   - Click on a deployment
   - View build and function logs

## 🔄 Updating Your App

1. **Make changes to your code**
2. **Commit and push to GitHub**
   ```bash
   git add .
   git commit -m "Update feature"
   git push origin main
   ```
3. **Vercel automatically redeploys** (if auto-deploy is enabled)

## 📊 Monitoring

- **Analytics**: Available in Vercel dashboard
- **Performance**: Check function execution times
- **Errors**: Monitor function logs for issues

## 🆘 Support

If you encounter issues:

1. Check the [Vercel Documentation](https://vercel.com/docs)
2. Review the build logs in your Vercel dashboard
3. Test your API endpoints individually
4. Verify environment variables are set correctly

## 🎉 Success!

Once deployed, your EcoFinds app will be available at:
- **Frontend**: `https://your-app.vercel.app`
- **API**: `https://your-app.vercel.app/api/`

The app includes:
- ✅ User authentication
- ✅ Product management
- ✅ Shopping cart
- ✅ Order system
- ✅ Messaging
- ✅ Customer service bot
- ✅ Dark mode
- ✅ Responsive design

Happy coding! 🌱
