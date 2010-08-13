require "test_helper"

class TestView < ActionView::TestCase
  tests ReverseCaptcha::View

  def setup
    Comment.captcha :nickname
  end

  test "captcha field map to object captcha attribute" do
    concat(form_for @comment do |f|
      concat f.captcha
    end)

    assert_select "form input#comment_nickname"
  end

  test "captcha field is hidden by css" do
    concat(form_for @comment do |f|
      concat f.captcha
    end)

    assert_select "form input#comment_nickname[style='display:none;']"
  end

end
