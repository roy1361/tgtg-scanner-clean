FROM python:3.11-alpine

# Install required packages
RUN apk add --no-cache git

# Install TGTG scanner
RUN pip install tgtg

# Create directory for tokens
RUN mkdir -p /tokens

# Set working directory
WORKDIR /app

# Copy config file if needed (we'll use env vars instead)
# COPY config.ini /app/config.ini

# Start the TGTG scanner
CMD ["python", "-m", "tgtg"] 