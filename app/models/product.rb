class Product < ApplicationRecord
  validates :title , :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validate :title_is_shorter_than_description

  scope :published, ->{where(published: true)}
  scope :priced_more_then, ->(price) {where('price >?', price)}

  def title_is_shorter_than_description
    return if title.blank? or description.blank?
    if description.length < title.length
      errors.add(:description, 'can\'t be shorter than title' )
    end
  end
end
