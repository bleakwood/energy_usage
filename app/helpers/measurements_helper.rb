module MeasurementsHelper
	def measurements_by_year_and_unit(measurements, year, unit)
		if grouped = measurements.group_by(&:year)[year].group_by(&:unit_id)[unit.id]
			grouped.sum(&:quantity).round(2)
		else
			0
		end
	end
end
