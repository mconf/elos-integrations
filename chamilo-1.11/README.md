# Chamilo + BBB plugin

Based on https://github.com/22phuber/docker-compose-chamilo-lms

Start the application with:

```
docker-compose up chamilo
```

Open `http://localhost:8080` and sign in as:

* User: admin
* Password: admin@chamilo

Load all test data, including the BigBlueButton plugin and its configurations:

```
docker exec -i chamilo-111_mysql_1 mysql -u root --password=pass < test-data.sql
```

To generate a new dump file:

```
docker exec chamilo-111_mysql_1 /usr/bin/mysqldump -u root --password=pass --all-databases > test-data.sql
```
