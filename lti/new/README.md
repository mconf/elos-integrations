# How to run it

Get the source code:

```
git submodule update
```

Download [ngrok](https://ngrok.com/) and run it with:

```
ngrok http 3000
```

Copy the URL it created (e.g. `9a772b7b6221.ngrok.io`) and run docker-compose with:


```
EXTERNAL_URL=9a772b7b6221.ngrok.io docker-compose up app
```

Open up http://ltiapps.net/test/tc.php and configure it with:

* Launch URL: http://9a772b7b6221.ngrok.io/lti/tool/messages/blti
* Consumer key: elos
* Shared secret: e61ce366827710661da01f0a12c88713e591880b

The key and secret are defined by `bbb-lti-broker-seeds.rb` and `bbb-app-rooms-dotenv`.

Press "Launch TP in a new window" and use it.

## Notes

* There's an nginx running on `localhost:3000` and redirecting the requests to the appropriate app.
* We need an external URL otherwise the apps can't communicate with each other and with the browser
  also.
* When upping the containers, they will build assets, migrate the database and seed it, so it
  takes a while. Follow it watching the logs (e.g. `docker logs -f new_broker_1`).
