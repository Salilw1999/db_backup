#!/bin/bash

echo "Starting database restore process..."

# Wait for MySQL to be ready
until mysqladmin ping -u root -piam@123 --silent; do
    echo "Waiting for MySQL to start..."
    sleep 3
done

# Run the SQL restore
mysql -u root -piam@123 smartz5q_erp_live < /var/opt/backup.sql

echo "Database restore completed."
