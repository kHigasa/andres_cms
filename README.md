# README

This is CMS with Rails5 and React.

## Flow
1. Cut branch from origin andres
1. Make pull request to develop

## Attention
- Comment your code to tell your intention of the implement
- When you merge from develop branch to master branch and some conflicts happen, you must give priority to master branch. Vice versa. (And andres too.)

## Deployment
### Staging
Adjust database schema

```
$ heroku run rails db:migrate --remote staging DISABLE_DATABASE_ENVIRONMENT_CHECK=1
```

Readjust database schema

```
$ heroku run rails db:migrate:reset --remote staging DISABLE_DATABASE_ENVIRONMENT_CHECK=1
```

Precompile assets

```
$ heroku run rails assets:precompile --remote staging RAILS_ENV=production
```

Compile webpacker

```
$ heroku run rails webpacker:compile --remote staging RAILS_ENV=production
```

Throw data into production environment

```
$ heroku run rails db:seed:production --remote staging RAILS_ENV=production
```

Restart web server

```
$ heroku restart --remote staging
```

Open web application

```
$ heroku open --remote staging
```

### Production(heroku)
Adjust database schema

```
$ heroku run rails db:migrate --remote heroku DISABLE_DATABASE_ENVIRONMENT_CHECK=1
```

Readjust database schema

```
$ heroku run rails db:migrate:reset --remote heroku DISABLE_DATABASE_ENVIRONMENT_CHECK=1
```

Precompile assets

```
$ heroku run rails assets:precompile --remote heroku RAILS_ENV=production
```

Compile webpacker

```zsh:terminal
$ heroku run rails webpacker:compile --remote heroku RAILS_ENV=production
```

Throw data into production environment

```
$ heroku run rails db:seed:production --remote heroku RAILS_ENV=production
```

Restart web server

```
$ heroku restart --remote heroku
```

Open web application

```
$ heroku open --remote heroku
```
