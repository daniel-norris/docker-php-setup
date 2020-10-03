        ____                __                  ____   __  __ ____
       / __ \ ____   _____ / /__ ___   _____   / __ \ / / / // __ \
      / / / // __ \ / ___// //_// _ \ / ___/  / /_/ // /_/ // /_/ /
     / /_/ // /_/ // /__ / ,<  /  __// /     / ____// __  // ____/
    /_____/ \____/ \___//_/|_| \___//_/     /_/    /_/ /_//_/


Docker PHP is a multi-container Docker environment for LEMP. It includes pre-built images that host PHP, Ubuntu, Nginx, Node and Composer. It also includes a complete `docker-compose.yml` file that will setup Redis and PHPMyAdmin.

The shell script `develop` enables you to streamline some of the development and installation workflow. Commands include:

`./develop install` - run to install Laravel

`./develop clean` - cleans up after Laravel installation

`./develop start` - spins up all your Docker containers

`./develop stop` - stops all containers for current project

`./develop artisan <command>` - opens up a bash session on the App container and runs `artisan`

`./develop art <command>` - as above but a shorthand version

`./develop composer <command>` - opens up a bash session and runs `composer`

`./develop test <command>` - opens up a bash session and runs phpunit

`./develop npm <command>` - as above for npm

`./develop yarn <command>` - as above for yarn

`./develop gulp <command>` - as above for gulp

## Blog Article
For a full walk-through, [I've written an article here on how to get started](https://www.danielnorris.co.uk/blog/posts/setup-docker-for-php-in-5-minutes/).

## Getting Started
Basic instructions are included below.

1. `git clone git@github.com:daniel-norris/docker-php-setup.git <project>`

2. `cd <project>` and run `chmod +x develop` to make the shell script executable

2. Open the `docker-compose.yml` file and fill out the values for:

    ```bash
    MYSQL_ROOT_PASSWORD: # pass for root user
    MYSQL_DATABASE: # database name
    MYSQL_USER: # username
    MYSQL_PASSWORD: # password
    ```

3. `cd <project>` and then run `./develop install`

4. Then `./develop clean`

5. Then change your docker-compose.yml file with variables for:

    ```bash
    MYSQL_ROOT_PASSWORD: ${DB_ROOT_PASSWORD}
    MYSQL_DATABASE: ${DB_DATABASE}
    MYSQL_USER: ${DB_USERNAME}
    MYSQL_PASSWORD: ${DB_PASSWORD}
    ```
6. Update your `.env` file with:

    ```bash
    DB_CONNECTION=mysql
    DB_HOST=db
    DB_PORT=3306
    DB_ROOT_PASSWORD=<yourrootpassword>
    DB_DATABASE=<yourdbname>
    DB_USERNAME=<yourusername>
    DB_PASSWORD=<yourpassword>
    ```

7. Change your root MySQL password here. Run `docker ps` and take not of the container id for the MySQL5.7 container

8. Run a bash shell on that container `docker exec -it <containerid> bash`

9. Login MySQL `mysql -u root -p` when prompted enter the original root password you set in the `docker-compose.yml` file

10. Once you've successfully logged in then alter the root record by running:
    ```bash
    FLUSH PRIVILEGES;
    ALTER USER 'root'@'localhost' IDENTIFIED BY '<newrootpassword>';
    exit
    ```

10. Then run `./develop art migrate`

11. `./develop npm install` and `./develop npm run dev --watch`

12. Now go to [localhost:8080](http://localhost:8080) and [localhost:8090](http://localhost:8090) for your Laravel app and PHPMyAdmin client respectively

When ever you want to launch your project, all you now need to to do is run `./develop start` and `./develop stop` when you are done. You can replicate these instructions for every new project you want to run, Docker only needs the build the images once and later caches these for faster installations.