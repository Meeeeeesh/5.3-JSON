class Palette < ActiveRecord::Base
  validates :name, :dom_one, :dom_two, :sec_one, :sec_two, :pop, presence: true
end
