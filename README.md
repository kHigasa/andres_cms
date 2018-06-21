# README

This is CMS with Rails5 and React.

## TIPS - deployment
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

Restart web server

```
$ heroku restart --remote staging
```

Open web application

```
$ heroku open --remote staging
```

### Production
