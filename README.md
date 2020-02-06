# AuthApp


## Getting Started

These instructions will get you a copy of the AuthApp project in rails on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them


#### Ruby
Ruby version for this project is `2.6.5`
rbenv is our recommened and preffered ruby version management software. If you don't have rbenv installed on your system. You can see the installation instructions [here.](https://github.com/rbenv/rbenv)
For installing the ruby version, type in the following command on your terminal ```rbenv install 2.6.5```.

One can check the installed ruby version by the following command ```ruby -v```.

The output should be something like this ```ruby 2.6.5p114```.

#### Rails
Rails version : `6.0.2`


#### Postgres

Our preffered database managing software is Postgres. If not installed, one can look into their official documentation [here](https://www.postgresql.org/download) and follow the steps as given.


#### Git
Make sure you have git installed on your system, if you haven't, just refer this [How to install Git.](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)


### Cloning the Repository
For cloning the Github repository and goto the project follow the following commands
```
git clone https://github.com/myselfshailendra/auth_app.git
cd auth_app
```


#### Project Dependencies

To setup the project, follow the below commands in the project directory.
```
gem install bundler
bundle install
```


#### Create and Migrate db
For setting up the migrations on your system, run the following commands on your system:
```
bundle exec rails db:create
bundle exec rails db:migrate
```


### Running Test
```
bundle exec rake
```

### Starting the rails applications
 ```
bundle exec rails s
```
Your application should be running on localhost:3000


### How It Works?
It's a basic login authentication web app which use sessions for authentication and cookies if you click on remember me option while login. Cookies expiry duration is 2 weeks. 
