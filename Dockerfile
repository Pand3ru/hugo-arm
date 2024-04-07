FROM arm64v8/ubuntu:latest

# Install runtime dependencies for Hugo Extended
RUN apt-get update && \
    apt-get install -y git ca-certificates wget && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /site

# Download and install Hugo Extended
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.124.1/hugo_extended_0.124.1_linux-arm64.tar.gz -O /tmp/hugo.tar.gz && \
    tar -xzf /tmp/hugo.tar.gz -C /usr/local/bin/ hugo && \
    rm /tmp/hugo.tar.gz
CMD ["hugo", "version"]
