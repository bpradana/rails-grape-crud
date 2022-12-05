# TODO: ugly import, should be auto-imported, but how?
require_relative '../../../../../lib/validators/custom_alpha'
require_relative '../../../../../lib/validators/custom_length'

class Api::V1::User::Resources::User < Grape::API
  resource :users do
    desc 'get all users'
    get do
      user = User.all
      present user, with: Api::V1::User::Entities::User
    end

    desc 'dump all users'
    get 'dump' do
      data = User.left_outer_joins(:posts).select('users.id, users.name, posts.title, posts.body').all

      header['Content-Disposition'] = 'attachment; filename=users.xlsx'
      content_type 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
      env['api.format'] = :binary

      p = Axlsx::Package.new
      wb = p.workbook
      wb.add_worksheet(name: 'users') do |sheet|
        sheet.add_row %w[id name title body]
        data.each do |d|
          sheet.add_row [d.id, d.name, d.title, d.body]
        end
      end

      p.use_shared_strings = true
      p.serialize('public/users.xlsx')

      File.binread('public/users.xlsx')
    end

    desc 'get a user'
    params do
      requires :id, type: Integer, desc: 'id of user'
    end
    get ':id' do
      user = User.find(params[:id])
      present user, with: Api::V1::User::Entities::User
    end

    desc 'get user\'s posts'
    params do
      requires :id, type: Integer, desc: 'id of user'
    end
    get ':id/posts' do
      posts = Post.where(user_id: params[:id])
      present posts, with: Api::V1::Post::Entities::Post
    end

    desc 'create a user'
    params do
      requires :name, type: String, custom_alpha: true, custom_length: 30, desc: 'name of the user'
    end
    post do
      users = User.create({ name: params[:name] })
      present users, with: Api::V1::User::Entities::User, status: 201
    end

    desc 'update a user'
    params do
      requires :id, type: Integer, desc: 'id of user'
      requires :name, type: String, custom_alpha: true, custom_length: 30, desc: 'name of the user'
    end
    put ':id' do
      user = User.find(params[:id])
      user.update({ name: params[:name] })
      present user, with: Api::V1::User::Entities::User, status: 204
    end

    desc 'delete a user'
    params do
      requires :id, type: Integer, desc: 'id of user'
    end
    delete ':id' do
      user = User.find(params[:id])
      user.destroy
      present nil, status: 204
    end
  end
end
