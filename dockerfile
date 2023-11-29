# Use the official Appsmith image as a base image
FROM index.docker.io/appsmith/appsmith-ce

# Set the working directory
WORKDIR /app

# Expose port 80
EXPOSE 80

# Copy the Appsmith stacks from the local directory to the container
COPY ./stacks /app/appsmith-stacks

# Define environment variables
ENV MONGO_INITDB_ROOT_USERNAME=$USERNAME \
    MONGO_INITDB_ROOT_PASSWORD=$PASSWORD \
    POSTGRES_USER=$USERNAME \
    POSTGRES_PASSWORD=$PASSWORD

# Expose ports for MongoDB and PostgreSQL (optional)
EXPOSE 27018
EXPOSE 5432

# Create volumes
VOLUME /app/appsmith-stacks
VOLUME /data/db
VOLUME /var/lib/postgresql/data

# Command to run the application
CMD ["npm", "start"]
