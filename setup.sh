#!/bin/bash

echo "=== TGTG Scanner Setup ==="
echo "This script will help you configure the TGTG scanner."
echo ""

# Check if config.ini exists
if [ ! -f "config.ini" ]; then
    echo "Error: config.ini not found!"
    exit 1
fi

# Get TGTG email
echo "Please enter your TGTG email address:"
read -r email

if [ -z "$email" ]; then
    echo "Error: Email address is required!"
    exit 1
fi

# Update config.ini with email
sed -i.bak "s/Username = YOUR_EMAIL_HERE/Username = $email/" config.ini

echo ""
echo "Configuration updated with your email: $email"
echo ""

# Show notification options
echo "Available notification methods:"
echo "1. Console (enabled for testing)"
echo "2. Telegram"
echo "3. Email (SMTP)"
echo "4. Discord"
echo "5. Webhook"
echo "6. IFTTT"
echo "7. NTFY"
echo "8. Pushsafer"
echo "9. Apprise"
echo ""

echo "To enable additional notifications, edit config.ini and set Enabled = true"
echo "for your preferred notification method."
echo ""

echo "Ready to start the scanner? (y/n)"
read -r start_scanner

if [ "$start_scanner" = "y" ] || [ "$start_scanner" = "Y" ]; then
    echo "Starting TGTG scanner..."
    docker compose up -d
    echo ""
    echo "Scanner started! Check logs with: docker compose logs -f"
    echo "To stop: docker compose down"
else
    echo "Setup complete. Run 'docker compose up -d' when ready to start."
fi 