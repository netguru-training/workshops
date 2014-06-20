# Workshop application

## Setup

### Database

Copy database config file (and edit if needed):

```shell
cp config/database.yml.sample config/database.yml
```

Make sure the user you've listed in `database.yml` is created for postgres:

```shell
createuser -s -r workshops
```

Setup database for your application (development and test environments):

```shell
bin/rake db:setup
bin/rake db:test:prepare
```
