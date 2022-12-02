# Basic CRUD with Rails and Grape

This is a simple example of a CRUD API using Rails and Grape. The API consists of two resources: `users` and `posts`. Users can have many posts. If a user is deleted, all of their posts are deleted as well.

## Routes
### Users
- `GET /users` - List all users
- `GET /users/:id` - Show a user
- `GET /users/:id/posts` - Show a user's posts
- `POST /users` - Create a user
- `PUT /users/:id` - Update a user
- `DELETE /users/:id` - Delete a user

### Posts
- `GET /posts` - List all posts
- `GET /posts/:id` - Show a post
- `POST /posts` - Create a post
- `PUT /posts/:id` - Update a post
- `DELETE /posts/:id` - Delete a post