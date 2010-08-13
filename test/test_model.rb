require "test_helper"

class TestModel < Test::Unit::TestCase

  def setup
    @comment = Comment.new
    Comment.captcha :nickname
  end

  def test_respond_to_captcha
    assert Comment.respond_to?(:captcha)
  end

  def test_error_message_on_attribute
    @comment.update_attributes :email => "jonh@gmail", :nickname => "teste"
    assert @comment.errors[:nickname], 'should be blank'
  end

  def test_not_save_in_database
    @comment.nickname = "teste"
    assert !@comment.save
  end

  def test_spam
    @comment.nickname = "jonh doe"
    assert @comment.spam?
  end

  def test_instance_level_captcha_attribute
    assert @comment.captcha_attribute, :nickname
  end

  def test_class_level_captcha_attribute
    assert @comment.captcha_attribute, :nickname
  end

end
