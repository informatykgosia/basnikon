#encoding: utf-8
class User < ActiveRecord::Base
  has_many :heros, :dependent=> :destroy
  email_format = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            :format => { :with => email_format, :message => 'e-mail niepoprawny'}
  acts_as_authentic do |config|
    config.crypted_password_field = :crypted_password
    config.require_password_confirmation = true
    config.merge_validates_format_of_email_field_options :message => "Podaj poprawny e-mail."
    config.merge_validates_format_of_login_field_options :message=> "Login może się składać z liter, cyfr oraz .-_@"
    config.merge_validates_length_of_login_field_options :too_short=> "Login musi się składać co najmniej z 3 znaków."
    config.merge_validates_length_of_login_field_options :too_long=> "Login może składać się maksymalnie ze 100 znaków."
    config.merge_validates_length_of_password_field_options :too_short=> "Hasło musi składać się co najmniej z 4 znaków."
    config.merge_validates_length_of_password_confirmation_field_options :too_short=> "Hasło musi składać się co najmniej z 4 znaków."
    
    config.merge_validates_confirmation_of_password_field_options :message=> "Brak zgodności z hasłem."
  end
end
