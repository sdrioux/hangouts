# Hangouts

# Description
Rails 5 recently implemented WebSockets through ActionCable.  This app builds a simple messaging app to play around with this new technology.  The app uses the async adapter in development, and Redis in production.  

A live version on Heroku can be found here: https://silas-hangouts.herokuapp.com/

# Setup
```sh
bundle install
rails db:create
rails db:migrate
rails s
```

# Todo
Scale - Paginate messages, only showing most recent, and allowing user to infinite scroll to see ones in the past.

Search - Allow users to look for old messages.

Currently POSTing new messages through REST.  Consider moving the create to WebSockets as well.

Delete - Delete recently posted messages, and have other client remove the message from the screen. 

Currently limited to two users talking to each other.  Consider allowing multiple users.
