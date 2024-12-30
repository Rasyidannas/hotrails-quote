# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# How to run Redis using Docker
1. Let's run this in your cli
    ```cli
        docker run --name redis-stack -p 6379:6379 -p 8001:8001 redis/redis-stack:latest
    ```

2. Check your connection redis
    ```cli
        docker exec -it redis-stack redis-cli
    ```
    then write `ping`, you should get `pong`
