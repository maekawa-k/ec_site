require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "confirm_mail" do
    mail = OrderMailer.confirm_mail
    assert_equal "Confirm mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
