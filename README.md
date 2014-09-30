# **= Description**

The main goal of this pair of scripts is to update the record dinamically for the ip address and name.
In many cases, you have many servers in different places and they don't have and ip public address, it's
important to know the current ip public address for do many administration tasks like backups, updates etc.

for get the public ip address in clients I use the library provided by dyndns (http://checkip.dyndns.org)

# **= Required Software**

[x] Ruby 1.8.x
[x] Rubygems 1.8.24
[x] Rails 2.3.x
[x] curl 7.35.x

# **= Installation:**

*Server*

You need to config the user and password for database and application:
 config/database.yml

You can set and select the database and adapter like mysql, postgresql or sqlite3

You need to run the migration script: 

 - rake db:migrate

You need to run the main app like a background job

 - ruby script/server -d

this app runs by default at port 3000 and webrick server

*Client*

You need to set the settings in settings.yml. The server_address is the public or domain for the server that runs
the app at 3000 port

The user and password are the app_user and app_password variables set at the server configuration in database.yml

The hostname is for the current for example:

This client runs at Chicago server, you can set "chicago" hostname, it's important previously create a record in the server
called "chicago" with a default ip address, inmediatetly this app update for ip record, and now you have the current ip address.

Finally you run the script:

- ruby client.rb

Aditionally you can add the script for crontab periodically tasks for update the record as you need.

# **= Creator:**

= Scripts were developed by *Carlos Monterrosa*. You can visit my homepage at: http://cmonterrosatechnotes.blogspot.com
Mexico 2014

