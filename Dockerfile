FROM python:3.11-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev curl && rm -rf /var/lib/apt/lists/*

# Install pgAdmin
RUN pip install pgadmin4

# Create non-root user
RUN useradd -m pgadmin
USER pgadmin
WORKDIR /home/pgadmin

# Environment for pgAdmin login
ENV PGADMIN_DEFAULT_EMAIL=admin@example.com
ENV PGADMIN_DEFAULT_PASSWORD=secret

EXPOSE 80
CMD ["pgadmin4"]
