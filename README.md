# README

## Setup

For development and testing you will need to setup your own postgres user:


```shell
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib libpq-dev
```

When the installation is done, login to the postgres user and access the postgresql shell.
```shell
sudo su - postgres
psql
```

Give the postgres user a new password:
```shell
\password postgres
Enter new password:
```

Next, create a new role named 'rails-dev' for the rails development with the command below:
```sql
create role rails_dev with createdb login password 'aqwe123';
```

Finally, setup your `config/database.yml`

```shell
cp config/database.example.yml config/database.yml
```

Fill in your chosen password and then run `bin/setup`


## Tests

Run `rspec spec`.

You can use `guard` during development to only run the tests for files that have been modified.

## Deployment

Each time the master branch is pushed to heroku, the app is deployed again.

# README TODO

* Ruby version

* Configuration

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

