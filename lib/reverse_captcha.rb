module ReverseCaptcha
  autoload :Model, 'reverse_captcha/model'
  autoload :View, 'reverse_captcha/view'
end

ActiveRecord::Base.send :include, ReverseCaptcha::Model
ActionView::Helpers::FormBuilder.send :include, ReverseCaptcha::View