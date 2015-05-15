# Band Manager
By Alec Arme
  Alec.arme@gmail.com

Band Manager is an app that allows one to Create Venues, and Create, Update, and Delete Bands. One can attach a Band to a venue, and a venue to a band.

Setup Instructions:
-  $ Bundle
-  $ postgres
-  $ rake db:create
-  $ rake db:migrate
-  $ rake db:test:prepare
-  $ ruby app.rb

These commands will run bundler to install all necessary gems, start postgres, create and migrate the DB (and test DB), and launch the app. Navigate to 'localhost:4567' to view.


Known errors:
  A configuration error caused the .bundle package to install in the local folder when developing the app. This should not interfere with functionality, but may cause unnecessary file bloat on clone/pull.
MIT License
