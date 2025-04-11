# Use official MySQL image
FROM mysql:8.0

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=iam@123
ENV MYSQL_DATABASE=smartz5q_erp_live

# Create target directory
RUN mkdir -p /var/opt/

# Copy backup and restore script into the container
COPY backup.sql /var/opt/backup.sql
COPY restore_db.sh /usr/local/bin/restore_db.sh

# Make the script executable
RUN chmod +x /usr/local/bin/restore_db.sh

# Optional: run script after container is ready (not on image build)
# ENTRYPOINT ["docker-entrypoint.sh"]
# CMD ["mysqld"]
