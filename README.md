Summary
=================

* My implementation of a food / recipe web application that will help users become better at cooking - developed using TDD and Agile methodologies.

* Based on the specification, I made a number of key implementation decisions:

  * Chose to build the website in Ruby-on-Rails
    * Well designed for scalably developing profile based applications (e.g. list of items which require individual information displayed and separate routing) as per the specification

    * Further by adopting an agile approach, MVP did not require single page application capability or specify any advanced JS features

    * I have, however, built similar web applications in a single page application format using the full MEAN JS Stack e.g. see [Subredditor](https://github.com/AlexHandy1/subredditor)

  * Modelled domain with 2 key objects - Recipes (to manage/ consolidate the information to be displayed for each recipe, including Ingredient objects) and Ingredients (to represent the multiple separate ingredients that belong to each Recipe model). This structure provided a scalable way to calculate and display the quantity of ingredients in each Recipe.

  * Chose to use Active Record to store Recipe and Ingredient data - this was particularly helpful when used in concert with the Paperclip gem to store images for the recipes.

  * Deliberately chose not to implement star feature due to potential ambiguity of implications on other user journeys and risk of spillover, superfluous functionality (e.g. how should users log-in to manage favourites? Should users be able to create and remove recipes on the site?) - in practice would have sought clarity with product manager/ team whilst delivering core functionality of first 3 user stories - should I have implemented basic favouriting (via a star) I would have done so using the following approach:
    * Create a User model that has many Recipes and has many FavouriteRecipes

    * Create a FavouriteRecipe model acting as a join table that belongs to the Recipe and User models

    * Create an alias method in User model e.g. ```- has_many :favourites, through: :favourite_recipes, source: :recipe``` to create readable way to access and manipulate the association

    * Create buttons listed by each recipe on front-end which links to Recipe controller method to add or delete favourite recipes e.g. ```if params[:favourite] == "favourite" current_user.favourites << @recipe```

    * Build in filtering button which calls a specified search/ scoping method in User model to display only favourited (or otherwise) Recipes

  * For filtering recipes by name, cooking time and ingredients, embedded 3 separate forms within table that provided parameters for tailored search methods to be called on the Recipe model to return the relevant query results from the database.

  * Implemented the CSS Bootstrap framework to deliver a mobile responsive website and adopted a clean, table based layout

  * Test driven development through unit tests and feature tests using Rspec and Capybara

* One key learning was around optimal way to conduct filtering by separate attributes (including those within an object e.g. ingredients) as opposed to an attribute wide text search. Designed implementation which created specific queries for each search and leveraged the ```joins``` Active Record method to search nested attributes.

* Further detail on areas where I would extend the application can be found listed below in 'Further improvements'

* Key outstanding questions would relate to the star feature and accompanying user journey as referenced earlier

Screenshots
-------

![Recipe Tracker](https://github.com/AlexHandy1/recipetracker/blob/master/app/assets/images/RecipeTracker.png)
![Recipe Profile Page](https://github.com/AlexHandy1/recipetracker/blob/master/app/assets/images/RecipeProfile.png)


Use Cases:
-------

```
- [x] AS A user
      I WANT to find recipes
      SO THAT I can get inspiration for cooking

- [x] AS A user
      I WANT details on an individual recipe
      SO THAT I am able to cook it

- [x] AS A user
      I WANT to filter through recipes
      SO THAT I can quickly get to the ones I am looking for

- [-] AS A user
      I WANT to star my favourite recipes
      SO THAT I can get back to my favourite recipes quickly

```

How to run
----

### Local Installation

Run the below commands in your command line interface to view the web page at localhost:3000 and run the test suite.

```
git clone https://github.com/AlexHandy1/recipetracker.git
cd recipetracker
bundle
bin/rake db:create
bin/rake db:migrate
bin/rake db:seed
bin/rails s

#to run tests
rspec

```

Technologies used
----

* Production - Ruby-on-Rails, HTML, CSS (Bootstrap), Paperclip (for Image file handling), will_paginate (for pagination)
* Testing - Rspec, Capybara, Shoulda (unit testing)

Further Improvements
----

*  Implement the Star functionalty adopting approach as outlined for v1

*  Provide users with the ability to upload, edit and delete recipes

* Store images in Amazon Web Servers to allow for much larger collection of images to be efficiently stored

* Enable further user interaction on recipes and introduce more single page application/ AJAX driven features to improve UX and perceived 'speed' of site e.g. user can add comments without reloading page

