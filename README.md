# DOCKER LEMP SETUP - LIGHTNING INSTALL

1. git clone git@github.com:daniel-norris/docker-php-setup.git <project>
2. open the `docker-compose.yml` file and fill out the values for:
    ```bash
    MYSQL_ROOT_PASSWORD: # pass for root user
    MYSQL_DATABASE: # database name
    MYSQL_USER: # username
    MYSQL_PASSWORD: # password
    ```
3. `cd <project>` and then run `./develop install`
4. then `./develop clean`
5. then change your docker-compose.yml file with variables for:
    ```bash
    MYSQL_DATABASE: ${DB_DATABASE}
    MYSQL_USER: ${DB_USERNAME}
    MYSQL_PASSWORD: ${DB_PASSWORD}
    ```
6. update your `.env` file with:
    ```bash
    DB_CONNECTION=mysql
    DB_HOST=db
    DB_PORT=3306
    DB_DATABASE=<yourdbname>
    DB_USERNAME=<yourusername>
    DB_PASSWORD=<yourpassword>
    ```
7. this is a good opportunity to change your root password for MySQL
8. then run `./develop art migrate`
