# Use a minimal Ubuntu image
FROM ubuntu:22.04

# Set environment variables for MongoDB
ENV MONGO_VERSION=7.0
ENV MONGO_INITDB_ROOT_USERNAME=root
ENV MONGO_INITDB_ROOT_PASSWORD=example
ENV MONGO_INITDB_DATABASE=mydatabase

# Update and install necessary dependencies
RUN apt-get update && \
    apt-get install -y gnupg curl && \
    curl -fsSL https://pgp.mongodb.com/server-7.0.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-server-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/mongodb-server-keyring.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list && \
    apt-get update && \
    apt-get install -y mongodb-org && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create MongoDB data directory
RUN mkdir -p /data/db && chown -R root:root /data/db

# Expose MongoDB port
EXPOSE 27017

# Start MongoDB
CMD ["mongod", "--bind_ip_all"]
