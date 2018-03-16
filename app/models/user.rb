class User < ApplicationRecord
 # validation_email
 # validation_domain
 validates :email, email: true
 validates :domain, domain: true


end
