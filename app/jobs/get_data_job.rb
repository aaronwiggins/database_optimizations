class GetDataJob < ActiveJob::Base
  queue_as :default

  def perform(user_search, user_email)
    SearchMailer.delayed_job(user_search, user_email).deliver_now
  end
end
