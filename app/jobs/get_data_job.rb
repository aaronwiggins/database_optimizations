class GetDataJob < ActiveJob::Base
  queue_as :default

  def perform(item)
    Assembly.create!(item)# Do something later
    #bin/delayed_jop start
    #bin/delayed_jop stop
  end
end
