class Delivery < ApplicationRecord
  belongs_to :customers, optional: true

  validates :postal_code,presence:true
  validates :address,presence:true
  validates :name,presence:true

  def delivery_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end

end
