class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_one_attached :image

  validates :tax_out_price, presence: true


 def with_tax_price
    (tax_out_price * 1.1).floor
 end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    image.variant(resize_to_limit: [300, 300]).processed#variant使用時にはgemファイル26行目をbundle installする
  end

end