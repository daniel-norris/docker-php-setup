# DOCKER LEMP SETUP - LIGHTNING INSTALL

Setup a complete containerised LEMP environment complete with Node and Redis containers for your front end and caching requirements in less than 5 minutes. Built these Docker images and uploaded to make publicly available along with shell scripts to simply the workflow for new users. 

This will accompany a new blog article coming soon. 

1. git clone git@github.com:daniel-norris/docker-php-setup.git <project>
2. `cd <project>` and run `chmod +x develop` to make the shell script executable 
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
7. change your root MySQL password here. Run `docker ps` and take not of the container id for the MySQL5.7 container 
8. run a bash shell on that container `docker exec -it <containerid> bash`
9. login MySQL `mysql -u root -p` when prompted enter the original root password you set in the `docker-compose.yml` file 
10. once you've successfully logged in then alter the root record by running: 
    ```bash
    FLUSH PRIVILEGES; 
    ALTER USER 'root'@'localhost' IDENTIFIED BY '<newrootpassword>'; 
    exit
10. then run `./develop art migrate`
11. `./develop npm install` and `./develop npm run dev --watch`
12. now go to localhost:8080 and localhost:8090 for your laravel app and phpmyadmin client respectively 
    
When ever you want to launch your project, all you now need to to do is run ./develop start and ./develop stop when you are done. You can replicate these instructions for every new project you want to run, Docker only needs the build the images once and later caches these for faster installations. 


