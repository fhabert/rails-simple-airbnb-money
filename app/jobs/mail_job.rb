class MailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "hey you"
    sleep(2)
    puts "goodbye"
  end
end
