require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "recruit" do
    mail = UserMailer.recruit
    assert_equal "Recruit", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "mattching_men" do
    mail = UserMailer.mattching_men
    assert_equal "Mattching men", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "mattching_women" do
    mail = UserMailer.mattching_women
    assert_equal "Mattching women", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
