FROM python:3.11-slim

RUN apt-get update && apt-get install -y libpq-dev curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install pgadmin4

# Create pgAdmin data dir with OpenShift-friendly permissions
RUN mkdir -p /var/lib/pgadmin \
    && chgrp -R 0 /var/lib/pgadmin \
    && chmod -R g+rwX /var/lib/pgadmin

# Do NOT set a fixed USER
WORKDIR /var/lib/pgadmin

ENV PGADMIN_DEFAULT_EMAIL=admin@example.com
ENV PGADMIN_DEFAULT_PASSWORD=secret
ENV PGADMIN_LISTEN_PORT=80

EXPOSE 80
CMD ["pgadmin4"]
