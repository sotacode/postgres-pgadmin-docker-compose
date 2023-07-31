# README.md

## Docker-Compose para PostgreSQL y pgAdmin

Este repositorio contiene una configuración Docker-Compose para desplegar un servicio PostgreSQL y una interfaz de usuario pgAdmin en contenedores Docker.

### Versiones de los servicios:
* PostgreSQL 15.1
* pgAdmin 4 v6.17

### Configuración

El archivo `docker-compose.yml` define los siguientes servicios:

* `db`: Este servicio es para una base de datos PostgreSQL. La imagen de Docker utilizada es `postgres:15.1`. El contenedor se llama `postgres_database`. Los datos de la base de datos se almacenan en el volumen local `./postgres_data`. La contraseña del usuario postgres se establece como `123456`.

* `pgAdmin`: Este servicio es para la interfaz de usuario pgAdmin. La imagen de Docker utilizada es `dpage/pgadmin4:6.17`. El contenedor se llama `pg_admin`. Este servicio depende del servicio `db`, lo que significa que el servicio `db` se iniciará antes que `pgAdmin`. El puerto 8080 del host está mapeado al puerto 80 del contenedor. Los datos de pgAdmin se almacenan en el volumen local `./pgadmin_data`. La contraseña y el correo electrónico predeterminados para pgAdmin se establecen como `123456` y `superman@google.com` respectivamente.

### Instrucciones de uso

1. Asegúrate de tener instalado Docker y Docker Compose en tu sistema. Si no es así, puedes descargarlos e instalarlos desde [aquí](https://docs.docker.com/get-docker/) y [aquí](https://docs.docker.com/compose/install/).

2. Clona este repositorio a tu máquina local.

3. Abre una terminal y navega hasta el directorio que contiene el archivo `docker-compose.yml`.

4. Ejecuta el siguiente comando para iniciar los servicios:

    ```
    docker-compose up -d
    ```

5. Navega a `http://localhost:8080` en tu navegador web para acceder a la interfaz de usuario de pgAdmin.

6. Utiliza el correo electrónico y la contraseña predeterminados proporcionados en el archivo `docker-compose.yml` para iniciar sesión en pgAdmin.

7. Para detener y eliminar los servicios, ejecuta el siguiente comando:

    ```
    docker-compose down
    ```

Nota: Por motivos de seguridad, te recomiendo que cambies las contraseñas y el correo electrónico predeterminados en un entorno de producción. No almacenes contraseñas en texto plano en tu archivo `docker-compose.yml`. Utiliza variables de entorno o Docker Secrets para manejar las credenciales sensibles.
