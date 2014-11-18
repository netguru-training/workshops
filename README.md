# Workshops application

Hi! We think it’s great that you want to **join along with Netguru** to start learning **Ruby on Rails**. Taking part in workshops is also a **great opportunity to start an internship** with us and become one of the Netguru folks. Since you have just taken your first step on your adventure with programming in RoR, we challenge you to complete the following task. **Ready, steady…Go!**

### Let’s start with a setup:

**Database**

Copy the database config file (and edit if needed): 
` cp config/database.yml.sample config/database.yml`

Make sure the user you've listed in `database.yml` is created for postgres:
`createuser -s -r workshops`

Setup the database for your application (development and test environments):
`bin/rake db:setup`
`bin/rake db:test:prepare`


### Issues to solve:

1. There are a few missing fields on the `User` model. Make sure `spec/models/user_spec.rb passes.`

2. Make sure settings for [devise](https://github.com/plataformatec/devise) are
   configured properly.  If they aren’t, most of the controller specs will fail: 
  * Most of the configuration changes require the server to be restarted.
  * At some point **you'll have to overwrite the default devise views** - you can find all the required info in the gem readme.
  
3. Check `spec/controllers/categories_controller_spec.rb` - there should be a
   couple errors on actions checking admin presence.

4. Next up: `Product` model and `spec/models/product_spec.rb`. Play with validations a bit, calculate average rating and you'll be good to go.

5. Fix specs for `Category` model.

6. Fix specs for `Review` model.

7. You'll have to deal with `ProductsController`. Again, you'll have to check for permissions. Only a product owner should be able to make changes. Make sure to give the user a proper message when they try to perform forbidden actions.

8. Make sure `ReviewDecorator` is used properly, There's one action which needs to be declared there. See `spec/decorators/review_decorator_spec.rb` for details.

9. Check if each review is assigned to user who wrote it.

10. If some actions (like links to edit a page, create a new one) are not allowed for a particular user then please hide them in a template (for example with `if`).

11. In navigation bar insert links for guest users to login / signup and for users that are already logged in - to logout.

12. Don't forget to check if application works in the browser :).

13. Unleash your design skills. Add some CSS to the application to make it prettier (we won't say it's ugly, but you know, it's not a beauty [YET!]). Please use [Bootstrap 3](http://getbootstrap.com/css/) for styling, which is already added to application. Psss! Don't forget about styling `devise` views :).

14. Create user profile page (using Boostrap 3). Use your imagination about what should go there. You can start with name, email, etc.

15. On user profile list 5 last user's reviews with formated date (dd-mm-yy).

16. Fill `seeds.rb` with 5 accounts for user and one admin account to login and example category with products and reviews.

17. Make sure your project is available on Heroku with **seeds data**.

## What disqualifies your application

1. Tests are not passing.

2. Website doesn't work on Heroku.

3. Design is not finished.

### Here are some great resources to help you with kicking off your adventure with Ruby and Rails:

* [http://www.codeschool.com/paths/ruby](http://www.codeschool.com/paths/ruby) - free Ruby and Rails courses available at the elementary level
* you want to be sure your Ruby basis are solid? Check out the Ruby Koans - [http://rubykoans.com/](http://rubykoans.com/)
* [http://guides.rubyonrails.org/](http://guides.rubyonrails.org/) - sooner or later this one will come in handy
* not feeling comfortable with JavaScript / jQuery? CodeSchool can help you with this one too - [http://www.codeschool.com/courses/try-jquery](http://www.codeschool.com/courses/try-jquery)

## Good Luck! 

*We want all attendees at netguru workshops to have an awesome harassment-free experience. Read our full [code of conduct](https://github.com/netguru-training/workshops/blob/master/code_of_conduct.md) for more details.*
