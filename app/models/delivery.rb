class Delivery < ApplicationRecord
  belongs_to :customers, optional: true
  
  

  def delivery_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end

end
