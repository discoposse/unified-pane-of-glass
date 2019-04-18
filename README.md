# Unified Pane of Glass - Ruby on Rails vCenter Portal

## What is this?

The idea came up to meet a need for certain people to access certain virtual machines in a VMware environment and be able to power them up and down as well as to reserve them for use for certain time periods.

This idea was brought to the VMworld 2018 hackathon and we developed the first pass there.  This repo is the continuing effort to grow out that idea into something more usable.

## What's with the name?

This is entirely a tongue-in-cheek reference to every possible vendor solution out there that tries to give you the "single pane of glass" when you actually need all of your panes of glass together as a Unifed Pane of Glass.

## How to set up the Unified Pane of Glass

There are a few things you need to get this going:

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

* Update the `config/database.yml` file with the username and database info which you used in the previous step

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


### TODO List of more goodies to be added

CORE
- [ ] Error handling - pretty much everywhere
- [ ] List VM Templates (not sure how to do this via API yet)
- [ ] Add PowerCLI sandbox option
- [ ] Dry up the controllers and organize vmURL better for less code repetition
- [ ] Disallow vCenter shutdown (use helper for is_vcenter?)
- [ ] Wildcard searches for specific instance view (static now)

FUNCTIONAL
- [ ] Assign an owner to each VM 
- [ ] Create reservation for a machine



SCRATCH

    ### NOT YET USED - Related to filtering
    # Convert output to string and parse
    #vm_string = JSON.parse(@vmresults["value"].to_s)
    #Flatten the JSON hash
    #vm_string_results = vm_string["value"].flatten(4)
    #@fitlered_results = vm_filter.select{}
    ### END FILTERING SECTION 


