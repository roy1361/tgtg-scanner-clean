# TGTG Scanner Setup

This directory contains the TGTG (Too Good To Go) scanner setup for monitoring your favorite stores and receiving notifications when new Magic Bags become available.

## Quick Setup

1. **Run the setup script:**
   ```bash
   ./setup.sh
   ```

2. **Follow the prompts to enter your TGTG email address**

3. **The scanner will start automatically and send you a login email**

## Manual Setup

If you prefer to configure manually:

1. **Set up environment variables:**
   ```bash
   cp .env.example .env
   # Edit .env with your actual values
   ```

2. **Edit `config.ini` (alternative method):**
   - Set your TGTG email address in the `[TGTG]` section
   - Enable your preferred notification method(s)

3. **Start the scanner:**
   ```bash
   docker compose up -d
   ```

## Available Notification Methods

- **Console** (enabled by default for testing)
- **Telegram** - Create a bot with @BotFather
- **Email (SMTP)** - Configure SMTP settings
- **Discord** - Create a Discord bot
- **Webhook** - Send to any webhook URL
- **IFTTT** - Use IFTTT webhooks
- **NTFY** - Push notifications
- **Pushsafer** - Push notifications
- **Apprise** - Multiple notification services

## Configuration

Edit `config.ini` to customize:
- Scan frequency (default: 60 seconds)
- Notification settings
- Location settings (for distance calculations)
- Schedule restrictions

## Usage

- **Start:** `docker compose up -d`
- **View logs:** `docker compose logs -f`
- **Stop:** `docker compose down`
- **Update:** `docker compose pull && docker compose up -d`

## First Run

On first run, the scanner will:
1. Send you a login email from TGTG
2. Wait for you to click the login link
3. Save your credentials for future runs
4. Send a test notification
5. Start monitoring your favorites

## Troubleshooting

- Check logs: `docker compose logs -f`
- Verify configuration: `docker compose config`
- Restart: `docker compose restart`

## More Information

- [GitHub Repository](https://github.com/Der-Henning/tgtg)
- [Configuration Wiki](https://github.com/Der-Henning/tgtg/wiki/Configuration) 