class GetDataJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    SearchMailer.report(args[0], args[1]).deliver_now
  end
end
