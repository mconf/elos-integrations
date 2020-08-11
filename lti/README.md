# How to run it

Download ngrok and sign up: https://ngrok.com/signup

Install it and connect to your account:

```
ngrok authtoken skia8d9V9nxRC9jwfgfnQ76laos09d87L4f2B78N37Jdfocmdj
```

Run it so it creates a tunnel to an internal HTTPS server. Running the LTI in an HTTP server
won't work when integrating it in some LMSs (e.g. Canvas running in another container).

Run it with:

```
ngrok http https://localhost:3443
```

Copy the URL it created (e.g. `9a772b7b6221.ngrok.io`) and run docker-compose with:


```
EXTERNAL_URL=9a772b7b6221.ngrok.io docker-compose up app
```

Open up http://ltiapps.net/test/tc.php and configure it with:

* Launch URL: `https://9a772b7b6221.ngrok.io/lti/tool/messages/blti`
* Consumer key: `test-key`
* Shared secret: `87e9393a73c15942eac42d89bc14c540f4eae2b6`

The key and secret are defined by env variables in `docker-compose.yml`.

Press "Launch TP in a new window" and use it.

## Notes

* There's an nginx running on `localhost:3000` and redirecting the requests to the appropriate app.
* We need an external URL otherwise the apps can't communicate with each other and with the browser
  also.
* When upping the containers, they will migrate the database and seed it, so it
  takes a while. Follow it watching the logs (e.g. `docker logs -f new_broker_1`).
