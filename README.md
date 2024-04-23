# Youtube sharing backend
## Introduction
- Backend for youtube sharing video application
- Built based on Ruby on Rails, Docker, MySQL
- Integrate testing with rSpec

## Prerequisites
- Ruby: 3.0.0
- Docker
- rSpec
- Websocket

## Installation & Configuration
To clone project, run:
```sh
git clone https://github.com/ShiedaKayn1975/youtube-sharing-app.git
```
After that, go to the root project directory, create your own `.env` file following this content and grant the value for these variables:
```
HOST=localhost
DATABASE_PASSWORD=12345678
DATABASE_USERNAME=youtube
JWT_SECRET=youtube-sharing
SIDEKIQ_USERNAME=admin
SIDEKIQ_PASSWORD=admin
```

Then, you have to run Docker to build project's containers, run:
```sh
docker-compose up -d --build
```

## Database installation
Next step, exec to MySQL container and create a MySQL user with granted permissions.
```sh
docker exec -it container_id /bin/sh
```
Access to MySQL shell
```sh
mysql -u root -p
```
Create MySQL user with granted permissions
```sh
CREATE USER 'youtube'@'*' IDENTIFIED WITH mysql_native_password BY '12345678';
GRANT ALL PRIVILEGES ON *.* TO 'youtube'@'*' WITH GRANT OPTION;
```
Finally, re-run docker build again:
```sh
docker-compose up -d --build
```

## Create seeding data
Exec to app container, and run:
```sh
rails db:seed
```
to create seed data

## Run the test
Exec to app container, and run:
```sh
rspec
```


