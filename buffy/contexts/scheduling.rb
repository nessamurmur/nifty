require 'digest'
require 'chronic'
require 'torquebox-scheduling'

class Scheduling
  DEFAULT_SCHEDULER = TorqueBox::Scheduling::Scheduler

  def self.generate_sha
    Digest::SHA2.new.to_s
  end

  def self.schedule_tweet(tweet, time, client, scheduler=DEFAULT_SCHEDULER)
    scheduler.schedule(generate_sha, at: Chronic.parse(time).to_i) do
      client.update(tweet)
    end
  end
end
