require 'rubygems'
require 'test/unit'
require "active_record"
require 'action_view'
require 'action_view/template'
require 'action_view/test_case'

require 'reverse_captcha'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

Dir["#{File.dirname(__FILE__)}/support/*.rb"].each { |f| require f }

load "schema.rb"

class ActionView::TestCase
  setup :set_controller
  setup :set_response
  setup :setup_new_comment

  def set_controller
    @controller = MockController.new
  end

  def set_response
    @response = MockResponse.new(self)
  end

  def setup_new_comment(options={})
    @comment = Comment.new({
      :id         => 1,
      :author     => "Daniel",
      :email      => "daniel@google.com",
      :body       => "bla bla bla"
    }.merge(options))
  end

  def protect_against_forgery?
    false
  end

  def comment_path(*args)
    '/comments'
  end
  alias :comments_path :comment_path
end