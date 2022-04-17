# Project - Members Only

This project is part of the Odin Project curriculum.
---

## Description : 

This project's goal was to to practice Authentication and Authorization.

Authentication was handled with Devise.

Authorization was centered around the Posts ressource where : 

1. unauthenticated users aren't allowed to see the author's name of a post using  the ` user_signed_in? ` helper.

2. For authenticated users, edit and delete button aren't rendered if the user is not the post author with the: ` owner? ` helper.


## Other notes :

We are rendering posts and then asking each time for the user name to display it. This
causes the N+1 Queries problem, therefore eager loading the user of a post is necessary.

_NOTE: N+1 Queries have been discussed later on in the curriculum. I decided to refactor the code after learning about them_

```ruby
# app/controllers/posts_controller.rb
@posts = Post.all.order(created_at: :desc).includes(:user)
```
