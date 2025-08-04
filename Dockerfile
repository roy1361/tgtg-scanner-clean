FROM derhenning/tgtg:latest-alpine

# Create directory for tokens
RUN mkdir -p /tokens

# Set working directory
WORKDIR /app

# Copy config file if needed (we'll use env vars instead)
# COPY config.ini /app/config.ini

# Start the TGTG scanner
CMD ["python", "-m", "tgtg"] 