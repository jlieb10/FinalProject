class Detail < ActiveRecord::Base
  belongs_to :apartment

  validates_presence_of :content, unless: ->(detail){detail.image.present?}
  validates_presence_of :image, unless: ->(detail){detail.content.present?}
end
