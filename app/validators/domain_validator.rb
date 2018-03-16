class DomainValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}$\z/im
      record.errors[attribute] << (options[:message] || "wrong domain address")
    end
  end
end
