class Boy < ActiveRecord::Base
  attr_accessible :age, :name, :number
  has_many :phrases
end
