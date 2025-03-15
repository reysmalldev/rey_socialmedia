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

## Previews
 ### Posts Page
 ![Captura de Tela 2025-03-14 às 22 25 30](https://github.com/user-attachments/assets/8b66ce8b-821e-49ce-b44b-9fc8a9a0df64)

 ### Post Show Page
 ![Captura de Tela 2025-03-14 às 22 30 59](https://github.com/user-attachments/assets/3782969a-0e0a-4305-9305-1bc677abf228)

 ### Friends Page
 ![Captura de Tela 2025-03-14 às 22 03 35](https://github.com/user-attachments/assets/c8cad648-f8e7-4250-b092-ca9067a8a3a8)

 ### Friends Send request
 ![Captura de Tela 2025-03-14 às 22 04 08](https://github.com/user-attachments/assets/9fc6d0a3-6aae-44be-bec3-8a9a6835038a)

 ### Friend Pending sent request
 ![Captura de Tela 2025-03-14 às 22 08 35](https://github.com/user-attachments/assets/f91cf5ea-750a-4198-a0c8-4baed91866e0)

 ### Friend Pending received request
 <img width="1421" alt="Captura de Tela 2025-03-14 às 22 09 46" src="https://github.com/user-attachments/assets/81f528c9-f37c-461a-aaea-889c4fa9f325" />

 ### Friends
 ![Captura de Tela 2025-03-14 às 22 15 12](https://github.com/user-attachments/assets/3b1f48c4-52e5-4890-85fb-1de3aec4337b)

 ### Users Page
 ![Captura de Tela 2025-03-14 às 22 32 09](https://github.com/user-attachments/assets/4c62e7ba-ff5b-41dc-b00e-35afabbf2966)
