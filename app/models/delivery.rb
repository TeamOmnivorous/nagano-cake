class Delivery < ApplicationRecord
   belongs_to :customers, optional: true
end
