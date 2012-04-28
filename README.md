# Your bookmailist

## Why?

Bookmailist allows you to simply have **a simple web page with a list of bookmarks** you feed **by sending emails containing links** to an email address of your choice.

## Requirements

* Some place to serve this Sinatra application. **Heroku** for example, fast and simple (and free).
* A **cloudmailin** account for your incoming emails (free for 200 emails a month).
* A **Mongo** database. Get it with your Heroku app using either **MongoHQ** or **MongoLab** plugins (with free accounts).

## How to

### Remarks

* I package all my gems under `vendor/bundle` and use Bundler to manage them. So don't be surprised to see `bundle exec` before most commands in this walkthrough.

### 1. Create a CloudMailin account

Goto [cloudmailin](http://cloudmailin.com) and signup.

### 2. Create an Heroku account

I did this a long time ago, now I have one, so just go on [Heroku](www.heroku.com) and do it by yourself, lazy.

### 3. Clone the app on your machine

I assume your development machine is prepared for Ruby and Git.

    cd some/where/on/your/drive
    git clone git@github.com:rchampourlier/Bookmailist.git

### 4. Configure the app for your CloudMailin account

### 5. Create your app on Heroku

Should be a simple `bundle exec heroku create`.

### 6. Create your Mongo database

Now that you've created your Heroku application, go to Heroku and install the MongoDB provider plugin you want (currently **MongoHQ** or **MongoLab**).

The configuration for the MongoDB is done in `config/initializers/mongodb.rb`. It should already include some options wether your db is local, MongoHQ or MongoLab.

#### Walkthrough for **MongoLab**

1. Install the plugin on Heroku/Apps/Your App.
2. Go to the plugin setup (on your app page, plugins are on top-right, just click on MongoLab line).
3. Add a user to your database:
	- user: bookmailist
	- password: <whatever-you-want>
4. You can delete the other user (the heroku one).

You're done with MongoLab, you just have to configure your app to use this Mongo DB now. The MongoDB configuration file is `config/initializers/mongodb.rb`. It is currently configured for a MongoLab database (so that's the easy way), and as you will see it relies on environment variables to get the database name and password (the user should be `bookmailist` if you followed this guide correctly until know).

To setup these environment variables, either you know how to do if you're using your own managed environment, or if you're using Heroku you do this way (explained [here]() too):

    bundle exec heroku config:add MONGODB_PASSWORD=<your password>
    bundle exec heroku config:add MONGODB_DATABASE=<your database name>

_NB: for a MongoLab database created within an Heroku app, your database name will surely be something like `heroku_app1234567`._


## Paranoid protection against spam

Your mailincloud address is private. You should create an email account you can forward to this address. To be sure you won't get spammed and unwanted list arrive in your bookmailist, you can set filters on incoming email to only accept emails coming from your own addresses. Just see with your email provider how to do this.