class TestJob
  include Sidekiq::Job

  def perform(name)
    # Do something
    puts "RUNNING JOB: #{name}"
  end
end
