class Assembly < ActiveRecord::Base
  has_many :sequences
  has_many :genes, through: :sequences
end
