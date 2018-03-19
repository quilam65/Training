class Product < ApplicationRecord

  belongs_to :category, optional: true

  before_save :strip_html_from_description
  before_save :set_all_title_lower_case

  validates :title , :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validate :title_is_shorter_than_description

  scope :published, ->{where(published: true)}
  scope :price_more_then, ->(price) {where('price >?', price)}

  extend Enumerize
  enumerize :level, in: [:easy, :medium, :hard]

  countrys = ISO3166::Country.all_translated
  extend Enumerize
  enumerize :country, in: countrys


  def title_is_shorter_than_description
    return if title.blank? or description.blank?
    if description.length < title.length
      errors.add(:description, 'can\'t be shorter than title' )
    end
  end

  def set_all_title_lower_case
    self.title = self.title.downcase
  end

  def strip_html_from_description
    self.description =
      ActionView::Base.full_sanitizer.sanitize(self.description)
  end
end
