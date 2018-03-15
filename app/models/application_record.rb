class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.validation_email()
    # domain_regex = /\^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}$\z/im
    email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :email, :presence => true,
                     :format    => {  :with => email_regex  }
  end

  def self.validation_domain()
    domain_regex = /\^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}$\z/im
    validates :domain, :presence => true,
                     :format    => {  :with => domain_regex  }
  end
end
