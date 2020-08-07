# Canvas + LTI + Elos

Canvas already has all the docker setup required to run it in their repository, we just needed
to adapt a few things.

These instructions are based on:

* https://github.com/instructure/canvas-lms/blob/release/2020-08-12.10/doc/docker/developing_with_docker.md
* https://github.com/instructure/canvas-lms/tree/master/doc/docker


## Instructions

```
git submodule update
docker-compose up web
# this might take a long time

docker-compose run --rm web bundle install
docker-compose run --rm web bundle exec rake db:create db:initial_setup canvas:compile_assets
# it will ask for an email, a password and some other things
# take not of the email and password to sign in later
```

Open http://localhost:8080. Sign in using the email and password set during setup.
