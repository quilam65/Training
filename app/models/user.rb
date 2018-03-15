class User < ApplicationRecord
 # email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
 # validates :email, :presence => true,
 #                  :format    => {  :with => email_regex  }
 validation_email
 validation_domain


end
