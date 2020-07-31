# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
    I have four model classes - User, Post, Muse, and MusePost
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    My User has two has_many relationships. One is with Posts and the other with Muses.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    Post belongs_to User and Muse belongs_to User
- [x] Include user accounts with unique login attribute (username or email)
    I ask my users to signup with a username.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    Both my Post and Muse controllers have CRUD routes.
- [x] Ensure that users can't modify content created by other users
    I make sure to check in my Edit/Delete routes that only the owner of the content can access those routes, otherwise they get sent back to the dashboard.
- [x] Include user input validations
    When the User Signs Up, I have a password, username, and email validation because these are required for the user to have.
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message