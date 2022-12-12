class Api::V1::Sidekiq::Resources::Sidekiq < Grape::API
  resource :sidekiq do
    desc 'create a new sidekiq job'
    post do
      TestJob.perform_later(params[:name])
    end
  end
end
