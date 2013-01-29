class Phrase < ActiveRecord::Base
  belongs_to :boy
  attr_accessible :image, :line, :number, :title
end
