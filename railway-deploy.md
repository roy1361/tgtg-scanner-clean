# Railway Deployment Guide for TGTG Scanner

## Prerequisites
- Railway account with $5 credit
- GitHub repository with your TGTG scanner code
- TGTG account and email

## Step 1: Prepare Your Repository

1. **Push your code to GitHub** (if not already done)
2. **Ensure these files are in your repo:**
   - `railway.toml`
   - `Dockerfile`
   - `config.ini` (for reference)

## Step 2: Deploy to Railway

1. **Go to [railway.app](https://railway.app)**
2. **Sign in with GitHub**
3. **Click "New Project"**
4. **Select "Deploy from GitHub repo"**
5. **Choose your TGTG scanner repository**
6. **Railway will automatically detect the Dockerfile and deploy**

## Step 3: Configure Environment Variables

In your Railway project dashboard:

1. **Go to the "Variables" tab**
2. **Add these environment variables:**

```
TGTG_USERNAME=your-tgtg-email@example.com
SLEEP_TIME=60
TZ=Europe/Berlin
LOCALE=en_US
CONSOLE=true
TELEGRAM=true
TELEGRAM_TOKEN=your-telegram-bot-token
TELEGRAM_CHAT_IDS=your-chat-id
```

## Step 4: Set Up Persistent Storage

1. **Go to "Settings" tab**
2. **Add a new volume called "tokens"**
3. **Mount it to `/tokens` in your service**

## Step 5: Configure Notifications

### For Telegram (Recommended):
1. **Create a Telegram bot** with @BotFather
2. **Get your bot token**
3. **Get your chat ID** (send a message to @userinfobot)
4. **Add to Railway variables:**
   ```
   TELEGRAM_TOKEN=your-bot-token
   TELEGRAM_CHAT_IDS=your-chat-id
   ```

### For Email:
```
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USERNAME=your-email@gmail.com
SMTP_PASSWORD=your-app-password
SMTP_TLS=true
SMTP_SENDER=your-email@gmail.com
SMTP_RECIPIENTS=your-email@gmail.com
```

## Step 6: Start the Service

1. **Go to "Deployments" tab**
2. **Click "Deploy"**
3. **Wait for deployment to complete**
4. **Check logs for any errors**

## Step 7: First Run Setup

1. **Check the logs** in Railway dashboard
2. **Look for the TGTG login email** (check your email)
3. **Click the login link** in the email
4. **The scanner will start monitoring** after successful login

## Monitoring

- **View logs:** Railway dashboard → "Deployments" → Click on deployment → "Logs"
- **Check status:** Railway dashboard → "Deployments" tab
- **Restart if needed:** Railway dashboard → "Deployments" → "Redeploy"

## Cost Management

With $5 credit, you can run this for about 1 month. To minimize costs:
- Set `SLEEP_TIME=300` (5 minutes instead of 1 minute)
- Monitor usage in Railway dashboard
- Stop the service when not needed

## Troubleshooting

### Common Issues:
1. **Login email not received:** Check spam folder
2. **Service not starting:** Check logs for errors
3. **Notifications not working:** Verify environment variables
4. **High costs:** Increase SLEEP_TIME to reduce API calls

### Useful Commands:
- **View logs:** Railway dashboard → Logs
- **Restart service:** Railway dashboard → Redeploy
- **Check variables:** Railway dashboard → Variables

## Next Steps

After successful deployment:
1. **Test notifications** by checking logs
2. **Monitor costs** in Railway dashboard
3. **Set up alerts** for high usage
4. **Consider alternatives** for long-term use (VPS, Raspberry Pi) 