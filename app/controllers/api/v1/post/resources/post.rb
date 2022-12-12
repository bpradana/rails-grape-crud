# frozen_string_literal: true

class Api::V1::Post::Resources::Post < Grape::API
  resource :posts do
    desc 'get all posts'
    get do
      posts = Post.all
      present posts, with: Api::V1::Post::Entities::Post
    end

    desc 'get a post'
    params do
      requires :id, type: Integer, desc: 'id of post'
    end
    get ':id' do
      post = Post.find(params[:id])
      present post, with: Api::V1::Post::Entities::Post
    end

    desc 'create a post'
    params do
      requires :title, type: String, desc: 'title of the post'
      requires :body, type: String, desc: 'body of the post'
      requires :user_id, type: Integer, desc: 'user id of the post'
    end
    post do
      post = Post.create({ title: params[:title], body: params[:body], user_id: params[:user_id] })
      present post, with: Api::V1::Post::Entities::Post, status: 201
    end

    desc 'update a post'
    params do
      requires :id, type: Integer, desc: 'id of post'
      optional :title, type: String, desc: 'title of the post'
      optional :body, type: String, desc: 'body of the post'
    end
    put ':id' do
      post = Post.find(params[:id])
      post.update({ title: params[:title], body: params[:body] })
      present post, with: Api::V1::Post::Entities::Post, status: 204
    end

    desc 'delete a post'
    params do
      requires :id, type: Integer, desc: 'id of post'
    end
    delete ':id' do
      post = Post.find(params[:id])
      post.destroy
      present nil, status: 204
    end
  end
end
