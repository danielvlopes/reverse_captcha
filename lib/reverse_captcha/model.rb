module ReverseCaptcha
  module Model
    extend ActiveSupport::Concern

    included do
      class_attribute :captcha_attribute
    end

    module ClassMethods
      def captcha(attribute)
        self.captcha_attribute = attribute
        attr_accessor attribute
        validate :humanity
      end
    end

    def captcha_attribute
      self.class.captcha_attribute
    end

    def spam?
      true unless send(captcha_attribute).blank?
    end

    protected
    def humanity
      errors.add(captcha_attribute, 'need to be blank') if spam?
    end

  end
end