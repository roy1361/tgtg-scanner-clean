FROM derhenning/tgtg:latest-alpine

# Create directory for tokens
RUN mkdir -p /tokens

# Set working directory
WORKDIR /app

# Copy config file if needed (we'll use env vars instead)
# COPY config.ini /app/config.ini

# Expose port for health checks (Railway requirement)
EXPOSE 8000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8000/health || exit 1

# Start the TGTG scanner
CMD ["python", "-m", "tgtg"] 