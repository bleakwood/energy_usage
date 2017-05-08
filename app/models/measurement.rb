class Measurement < ApplicationRecord
	belongs_to :unit
	belongs_to :building
	validates :unit_id, uniqueness: { scope: [:building_id, :year], message: "should happen once per year" }
end
