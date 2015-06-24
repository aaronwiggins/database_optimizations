require 'test_helper'

class SearchMailerTest < ActionMailer::TestCase
  test "report" do
    mail = SearchMailer.report
    assert_equal "Report", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
