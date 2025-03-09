# PostgreSQL and pgAdmin with Docker Compose

A production-ready Docker Compose setup for running PostgreSQL database with pgAdmin web interface, featuring SSL encryption for enhanced security.

## 🚀 Features

- PostgreSQL 15.1 database server with SSL encryption
- pgAdmin 4 v6.17 web interface
- Secure configuration with environment variables
- Health checks for container orchestration
- Persistent data storage
- Bridge network for container isolation

## 📋 Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## 🛠️ Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/sotacode/postgres-pgadmin-docker-compose
   cd postgres-pgadmin-docker-compose
   ```

2. Create a `.env` file in the project root (or modify the existing one) with your credentials:
   ```env
   # PostgreSQL Configuration
   POSTGRES_PASSWORD=YourStrongPasswordHere123!@#
   POSTGRES_USER=postgres
   POSTGRES_DB=postgres_db

   # pgAdmin Configuration
   PGADMIN_DEFAULT_EMAIL=your.email@domain.com
   PGADMIN_DEFAULT_PASSWORD=YourStrongPgAdminPass456!@#

   # Port Configuration
   PGADMIN_PORT=8080
   POSTGRES_PORT=5432
   ```

3. Start the services:
   ```bash
   docker-compose up -d
   ```

4. Access pgAdmin:
   - Open your browser and navigate to `http://localhost:8080`
   - Login using the credentials set in your `.env` file:
     - Email: your.email@domain.com
     - Password: YourStrongPgAdminPass456!@#

## 🔒 Connecting to PostgreSQL via pgAdmin

1. In pgAdmin, right-click on "Servers" and select "Create" → "Server"
2. In the "General" tab, give your connection a name (e.g., "Local PostgreSQL")
3. In the "Connection" tab, enter:
   - Host name/address: `db` (this is the service name in docker-compose)
   - Port: `5432`
   - Maintenance database: `postgres_db`
   - Username: `postgres`
   - Password: Your POSTGRES_PASSWORD from .env file

## 📁 Project Structure

```
.
├── docker-compose.yml    # Docker Compose configuration
├── .env                 # Environment variables
├── init-ssl.sh         # SSL certificate initialization script
├── postgres_data/      # PostgreSQL data directory
└── pgadmin_data/      # pgAdmin data directory
```

## 🔐 Security Features

- SSL encryption enabled by default
- Secure password authentication (scram-sha-256)
- Environment variables for sensitive data
- Isolated network for containers
- Health checks to ensure service availability

## 🛑 Stopping the Services

To stop and remove the containers:
```bash
docker-compose down
```

To stop and remove containers along with volumes (this will delete all data):
```bash
docker-compose down -v
```

## ⚠️ Production Considerations

1. Change all default passwords and credentials
2. Use Docker secrets or a secure secrets management system
3. Regular backup of your data volumes
4. Configure proper firewall rules
5. Keep your Docker images updated
6. Monitor your containers' health and logs

## 🤝 Contributing

Feel free to open issues and pull requests for any improvements you want to add.

## 📝 License

This project is open source and available under the [MIT License](LICENSE).
