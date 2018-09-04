# Unified Pane of Glass - Ruby on Rails vCenter Portal

There are a few things you need to get this going

* Ruby version 2.3.6 (might work with others but built on 2.3.6)

* MySQL version 14 (Community Edition used for development)

* Git clone the repo to your local machine or server

* Run a `bundle install` from the root to install all the Gems and dependencies

* Database creation using one database for now (this is not desired in the long term)
```
mysql -u root -p
create database upog;
create user 'databaseuser'@'%' identified by 'databasepassword';
grant all privileges on upog.* to 'databaseuser'@'%';
flush privileges;
```
* Environment setup - 12-factor(ish) by using environment variables to set up a few credentials using your own choice of passwords and usernames
```
export RAILS_VCENTER_USER=yourusername@yourssodomain
export RAILS_VCENTER_PASS=vcenterpassword
export RAILS_VCENTER_NAME=vcenterFQDN
export RAILS_VCENTER_URL=https://vcenterFQDN
export UPOG_DATABASE_USERNAME=databaseuser
export UPOG_DATABASE_PASSWORD=databasepassword
```

* Database initialization:
`
rake db:migrate
`
* Start it up using `rails server` from the root folder and click on [http://localhost:3000](http://localhost:3000)

* Feel free to update the app/assets/logo.png file with your own

There may be more to the process. Please submit an issue if there is anything that doesn't work for you.



