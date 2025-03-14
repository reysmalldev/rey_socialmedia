# The Odin Project Final Project

    [Ok] - Use PostgreSQL for your database from the beginning (not SQLite3), that way your deployment will go much more smoothly.
    
    [Ok] - Users must sign in to see anything except the sign in page.

    [Ok] - User sign-in should use the Devise gem. Devise gives you all sorts of helpful methods so you no longer have to write your own user passwords, sessions, and #current_user methods. See the Railscast on Devise (which uses Rails 3) for a step-by-step introduction. The docs will be fully current.
        - Done with Rails 8 auth system

    [Ok] - Users can send follow requests to other users.

    [Ok] - Users can create posts (begin with text only).

    [Ok]- Users can like posts.

    [Ok] - Users can comment on posts.

    [Ok]- Posts should always display the post content, author, comments, and likes.

    [Ok] - There should be an index page for posts, which shows all the recent posts from the current user and users they are following.

    [Ok] - Users can create a profile with a profile picture. You may be able to get the profile picture when users sign in using OmniAuth. If this isn’t the case you can use Gravatar to generate the photo.
        Done with ActiveStorage

    [Partial] - A user’s profile page should contain their profile information, profile photo, and posts.

    [Partial] - There should be an index page for users, which shows all users and buttons for sending follow requests to users the user is not already following or have a pending request.

    [Todo] - Set up a mailer to send a welcome email when a new user signs up. Use the Letter Opener gem to test it in development mode.

    [Todo] - Deploy your App to a hosting provider.
    
    [Todo] - Set up an email provider and start sending real emails.
