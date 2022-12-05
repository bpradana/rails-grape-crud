require 'json'

class Api::V1::Faraday::Resources::Faraday < Grape::API
  resource :faraday do
    conn = Faraday.new({ url: 'https://jsonplaceholder.typicode.com' })

    desc 'Posts'
    get 'posts' do
      res = conn.get('/posts').body
      JSON.parse(res)
    end

    desc 'Comments'
    get 'comments' do
      res = conn.get('/comments').body
      JSON.parse(res)
    end
  end
end
