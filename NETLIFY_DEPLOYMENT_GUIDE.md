# Netlify Deployment Guide for EcoFinds

## 🚀 Complete Step-by-Step Deployment Guide

### Prerequisites
- Node.js installed on your system
- Git repository (your project should be in a Git repo)
- Netlify account (free tier is fine)

---

## Step 1: Install Netlify CLI

Open your terminal/command prompt and run:

```bash
npm install -g netlify-cli
```

**Alternative if you don't want to install globally:**
```bash
npx netlify-cli
```

---

## Step 2: Login to Netlify

```bash
netlify login
```

This will open your browser to authenticate with Netlify.

---

## Step 3: Initialize Your Project

Navigate to your project root directory and run:

```bash
netlify init
```

**Follow the prompts:**
- Choose "Create & configure a new site"
- Enter a site name (or leave blank for auto-generated)
- Choose your team (usually your personal account)

---

## Step 4: Deploy Preview (Test Build)

```bash
netlify deploy --build
```

This will:
- Build your React app
- Deploy to a preview URL
- Show you the preview URL in the terminal

**Test the preview URL to make sure everything works!**

---

## Step 5: Deploy to Production

Once you're satisfied with the preview:

```bash
netlify deploy --prod
```

This deploys to your live site URL.

---

## Step 6: Set Up Environment Variables (Important!)

Since your app uses API calls, you'll need to configure the backend URL:

### Option A: Via Netlify Dashboard
1. Go to [netlify.com](https://netlify.com)
2. Select your site
3. Go to **Site settings** → **Environment variables**
4. Add these variables:

```
REACT_APP_API_URL=https://your-backend-url.vercel.app
```

### Option B: Via CLI
```bash
netlify env:set REACT_APP_API_URL "https://your-backend-url.vercel.app"
```

---

## Step 7: Update Your Frontend Code

You need to update your frontend to use the environment variable for API calls. 

**Create a new file:** `client/src/config/api.js`

```javascript
const API_BASE_URL = process.env.REACT_APP_API_URL || '';

export const api = {
  get: (url) => fetch(`${API_BASE_URL}${url}`),
  post: (url, data) => fetch(`${API_BASE_URL}${url}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data)
  }),
  // Add other methods as needed
};
```

**Then update your axios calls to use the base URL.**

---

## Step 8: Redeploy

After making changes:

```bash
netlify deploy --prod
```

---

## 🔧 Troubleshooting Common Issues

### Issue 1: Build Fails
**Solution:** Make sure you're in the project root and run:
```bash
cd client
npm install
npm run build
```

### Issue 2: 404 on Page Refresh (React Router)
**Solution:** The `netlify.toml` file I created includes redirect rules for this.

### Issue 3: API Calls Fail
**Solution:** 
1. Make sure your backend is deployed (Vercel, Heroku, etc.)
2. Set the `REACT_APP_API_URL` environment variable
3. Update your frontend code to use the environment variable

### Issue 4: CORS Errors
**Solution:** Update your backend CORS settings to allow your Netlify domain.

---

## 📋 Quick Commands Summary

```bash
# Install CLI
npm install -g netlify-cli

# Login
netlify login

# Initialize
netlify init

# Deploy preview
netlify deploy --build

# Deploy production
netlify deploy --prod

# Set environment variable
netlify env:set REACT_APP_API_URL "https://your-backend-url.com"

# View site info
netlify status
```

---

## 🎯 Next Steps After Deployment

1. **Test all functionality** on the live site
2. **Set up custom domain** (optional)
3. **Configure automatic deployments** from Git
4. **Set up monitoring** and analytics

---

## 📞 Need Help?

- Netlify Docs: https://docs.netlify.com/
- Netlify Community: https://community.netlify.com/
- Your site dashboard: https://app.netlify.com/

---

**Your site will be live at:** `https://your-site-name.netlify.app`
