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

## Issues to solve:

1. There are a few missing fields on `User` model, make sure `spec/models/user_spec.rb` passes.
2. Make sure settings for [devise](https://github.com/plataformatec/devise) are
   configured properly. If you don't do that - most of the controller specs will
fail.
  * The most of configuration changes requires server to be restarted.
  * At some point you'll have to overwrite the default devise views - you can
    find all the required info in the gem readme.
3. Check `spec/controllers/categories_controller_spec.rb` - there should be a
   couple errors regarding actions checking admin presence.
4. Next up: `Product` model and `spec/models/product_spec.rb`. Play with
   validations a bit, calculate average rating and you'll be good to go.
5. Fix specs for `Category` model.
6. You'll have to deal with `ProductsController`. Again, you'll have to check
   for permissions - only product owner should be able to make changes. Make
sure to give user a proper message when they try to perform forbidden actions.
7. Make sure `ReviewDecorator` is used properly, there's one action which needs
   to be declared there. See `spec/decorators/review_decorator_spec.rb` for
details.
8. Don't forget to check if application works in the browser:)
9. Unleash your design skills - add some CSS to the application to make it
   prettier (we don't say it's ugly, but you know, it's not a beauty [YET!])
10. Make sure your project available on heroku.
