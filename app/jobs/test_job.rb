# frozen_string_literal: true

class TestJob < ApplicationJob
  before_enqueue do |job|
    puts "ENQUEUED JOB: #{job}"
  end

  after_perform do |job|
    puts "PERFORMED JOB: #{job}"
  end

  def perform(name)
    # Do something
    sleep 5
    puts "RUNNING JOB: #{name}"
  end
end
