#Problem Specification

You will be building a single-user Rails application to allow one person to manage his or her DVD catalog.

##DVDs

###Required

* I must be able to add/view/edit/remove DVDs.
* At a minimum, a DVD must contain fields for the name, release date, summary, and ASIN (Amazon product ID).
	* Only name and summary shall be mandatory.
	* Name shall enforce uniqueness.
* When adding/editing a DVD I must be able to specify the actors/actresses in the movie. (many-to-many relationship)
* When adding/editing a DVD I must be able to specify the director of the movie. (many-to-one relationship)
* When viewing a DVD, I should have a clickable link to the Amazon product page, if and only if an ASIN is present.

###Optional

* A DVD may contain whatever other information you feel is relevant, but must have proper and meaningful validations for all fields.
* When adding/editing a DVD, I should be able to add an actor/actress/director not already present in the system, and have a record for that actor/actress added to the system.
* I should be able to search for DVDs by name, director, or actor/actress.

##Actors

###Required

* I should be able to add/view/edit/remove Actors, and upon removal, have the association rows binding them to movies be cleared.
* When viewing an Actor, I must see a list of movies they have been in.
* At a minimum, Actor must contain fields for name, date of birth, and gender.
	* Only name and gender shall be mandatory.
  * Name shall enforce uniqueness.
* When editing an Actor, I must be able to add to/remove from the set of movies that they have been in.

###Optional

* I should be able to search for actors by name, age range (not date of birth!), or movie (show a list of actors in that movie).

##Directors

Same required/optional features as Actor.

##Other

###Required

* The code must be written to run under MRI 1.9.3-p194.

###Optional

* Test cases for all functionality, using RSpec and/or Cucumber.
* It's recommended you use FactoryGirl instead of fixtures.
* If you have front-end chops, it's recommended you put some effort into a reasonably slick/smooth UI.
