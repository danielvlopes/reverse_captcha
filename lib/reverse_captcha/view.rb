module ReverseCaptcha
  module View

    def captcha(options={})
      text_field object.captcha_attribute, options.reverse_merge(:style => "display:none;")
    end

  end
end