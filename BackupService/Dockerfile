FROM ubuntu:latest

# Set the working directory to /service
WORKDIR /backupService

# Install the required packages
RUN apt-get update \
    && apt-get install -y postgresql-client \
    && apt-get install -y python3


RUN echo "*:$DB_PORT:$DB_NAME:$DB_USER:$DB_PASSWORD" > /backupService/.pgpass \
    && chmod 600 /backupService/.pgpass

# Export PGPASSFILE environment variable
ENV PGPASSFILE /backupService/.pgpass
ENV PGPASSWORD=$DB_PASSWORD

# Copy the script into the container
COPY BackupService.py .

# Set the entrypoint to the script
CMD ["python3", "BackupService.py"]
