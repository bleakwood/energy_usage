class MeasurementsController < ApplicationController

	def index
		year = params["year"]
		@years_list = Measurement.select(:year).order(:year).distinct.pluck(:year)
		@years_array = @years_list.map {|year| [year, year]}
		@units = Unit.all
		@measurements = Measurement.all
		@measurements = @measurements.where(year: year) if year = params["year"]
		@building_year_pairs = @measurements.select(:building_id, :year).group("building_id, year")
		@buildings = Building.all.select(:id, :name).group_by(&:id)
		@measurements = @measurements.group_by(&:building_id)
	end
end
