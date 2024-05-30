# db/seeds.rb

# Clear existing data to prevent duplicates
Spot.delete_all

# Seed data for surf spots
spots_data = [
  { name: 'Bettys Bay', ideal_swell_direction: '190-260', lower_swell_direction: '185-190', upper_swell_direction: '260-265', ideal_wave_force: 3.5, ideal_wind_direction: '330-60', lower_wind_direction: '60-70', upper_wind_direction: '320-330', ideal_tide: '1-2', wave_quality: 8 },
  { name: 'Pringle Bay', ideal_swell_direction: '210-270', lower_swell_direction: '200-210', upper_swell_direction: '270-275', ideal_wave_force: '4-6', ideal_wind_direction: '100-160', lower_wind_direction: '90-100', upper_wind_direction: '160-170', ideal_tide: '1-2', wave_quality: 7 },
  { name: 'Cool Bay', ideal_swell_direction: '190-270', lower_swell_direction: '185-190', upper_swell_direction: '270-275', ideal_wave_force: '1.5-2.5', ideal_wind_direction: '70-130', lower_wind_direction: '60-70', upper_wind_direction: '130-140', ideal_tide: '3-5', wave_quality: 6 },
  { name: 'Gordons Bay', ideal_swell_direction: '190-235', lower_swell_direction: '185-190', upper_swell_direction: '235-240', ideal_wave_force: '4-7', ideal_wind_direction: '70-130', lower_wind_direction: '60-70', upper_wind_direction: '130-140', ideal_tide: '3-5', wave_quality: 5 },
  { name: 'Strand', ideal_swell_direction: '190-235', lower_swell_direction: '185-190', upper_swell_direction: '235-240', ideal_wave_force: '2+', ideal_wind_direction: '70-130', lower_wind_direction: '60-70', upper_wind_direction: '130-140', ideal_tide: '3-5', wave_quality: 5 },
  { name: 'Muizenberg', ideal_swell_direction: '190-225', lower_swell_direction: '185-190', upper_swell_direction: '225-230', ideal_wave_force: '2-6', ideal_wind_direction: '280-30', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '3-5', wave_quality: 7 },
  { name: 'Dangers', ideal_swell_direction: '170-210', lower_swell_direction: '165-170', upper_swell_direction: '210-215', ideal_wave_force: '2-6', ideal_wind_direction: '280-31', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '3-5', wave_quality: 6 },
  { name: 'Kalk Bay Reef', ideal_swell_direction: '170-210', lower_swell_direction: '165-170', upper_swell_direction: '210-215', ideal_wave_force: '3-6', ideal_wind_direction: '280-33', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '3-5', wave_quality: 8 },
  { name: 'Black Rocks', ideal_swell_direction: '170-210', lower_swell_direction: '165-170', upper_swell_direction: '210-215', ideal_wave_force: '3-6', ideal_wind_direction: '280-33', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '3-5', wave_quality: 8 },
  { name: 'Dias Beach', ideal_swell_direction: '190-225', lower_swell_direction: '185-190', upper_swell_direction: '225-230', ideal_wave_force: '2-6', ideal_wind_direction: '280-34', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '3-5', wave_quality: 7 },
  { name: 'Platboom', ideal_swell_direction: '200-270', lower_swell_direction: '185-190', upper_swell_direction: '270-275', ideal_wave_force: '1-2', ideal_wind_direction: '280-35', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '1-2', wave_quality: 7.5 },
  { name: 'Extensions', ideal_swell_direction: '220-270', lower_swell_direction: '215-220', upper_swell_direction: '270-275', ideal_wave_force: '2.5-4.5', ideal_wind_direction: '90-146', lower_wind_direction: '80-90', upper_wind_direction: '146-156', ideal_tide: '3-5', wave_quality: 6.5 },
  { name: 'Scarborough', ideal_swell_direction: '205-270', lower_swell_direction: '200-205', upper_swell_direction: '270-275', ideal_wave_force: '2.5-4.5', ideal_wind_direction: '90-146', lower_wind_direction: '80-90', upper_wind_direction: '146-156', ideal_tide: '3-5', wave_quality: 5 },
  { name: 'Misty Cliffs', ideal_swell_direction: '205-270', lower_swell_direction: '200-205', upper_swell_direction: '270-275', ideal_wave_force: '2.5-4.5', ideal_wind_direction: '0-85', lower_wind_direction: '350-0', upper_wind_direction: '85-95', ideal_tide: '3-5', wave_quality: 6 },
  { name: 'Outer Kom', ideal_swell_direction: '205-270', lower_swell_direction: '200-205', upper_swell_direction: '270-275
    { name: 'Glen Beach', ideal_swell_direction: '200-270', lower_swell_direction: '195-200', upper_swell_direction: '270-275', ideal_wave_force: '2-3', ideal_wind_direction: '90-146', lower_wind_direction: '80-97', upper_wind_direction: '146-162', ideal_tide: '1-3', wave_quality: 5.5 },
    { name: 'Queens Beach', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '1.5-2.5', ideal_wind_direction: '90-146', lower_wind_direction: '80-98', upper_wind_direction: '146-163', ideal_tide: '3-5', wave_quality: 4.5 },
    { name: 'Sollys', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '1.5-2.5', ideal_wind_direction: '90-146', lower_wind_direction: '80-99', upper_wind_direction: '146-164', ideal_tide: '3-5', wave_quality: 4 },
    { name: 'Off the Wall', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '2-4', ideal_wind_direction: '90-146', lower_wind_direction: '80-100', upper_wind_direction: '146-165', ideal_tide: '3-5', wave_quality: 7 },
    { name: 'Thermos', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '3-5', ideal_wind_direction: '90-146', lower_wind_direction: '80-101', upper_wind_direction: '146-166', ideal_tide: '3-5', wave_quality: 8 },
    { name: 'Derdesteen', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '2-4', ideal_wind_direction: '0-100', lower_wind_direction: '350-0', upper_wind_direction: '100-110', ideal_tide: '3-5', wave_quality: 8 },
    { name: 'Elands Bay', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '2-5', ideal_wind_direction: '90-146', lower_wind_direction: '80-90', upper_wind_direction: '146-156', ideal_tide: '3-5', wave_quality: 9 }
  ]

    spots_data.each do |spot|
      Spot.create!(
        name: spot[:name],
        ideal_swell_direction: spot[:ideal_swell_direction],
        lower_swell_direction: spot[:lower_swell_direction],
        upper_swell_direction: spot[:upper_swell_direction],
        ideal_wave_force: spot[:ideal_wave_force],
        ideal_wind_direction: spot[:ideal_wind_direction],
        lower_wind_direction: spot[:lower_wind_direction],
        upper_wind_direction: spot[:upper_wind_direction],
        ideal_tide: spot[:ideal_tide],
        wave_quality: spot[:wave_quality]
      )
    end

    puts "Seeding complete!"

# Clear existing data to prevent duplicates
Spot.delete_all

# Seed data for surf spots
spots_data = [
  { name: 'Bettys Bay', ideal_swell_direction: '190-260', lower_swell_direction: '185-190', upper_swell_direction: '260-265', ideal_wave_force: 3.5, ideal_wind_direction: '330-60', lower_wind_direction: '60-70', upper_wind_direction: '320-330', ideal_tide: '1-2', wave_quality: 8 },
  { name: 'Pringle Bay', ideal_swell_direction: '210-270', lower_swell_direction: '200-210', upper_swell_direction: '270-275', ideal_wave_force: '4-6', ideal_wind_direction: '100-160', lower_wind_direction: '90-100', upper_wind_direction: '160-170', ideal_tide: '1-2', wave_quality: 7 },
  { name: 'Cool Bay', ideal_swell_direction: '190-270', lower_swell_direction: '185-190', upper_swell_direction: '270-275', ideal_wave_force: '1.5-2.5', ideal_wind_direction: '70-130', lower_wind_direction: '60-70', upper_wind_direction: '130-140', ideal_tide: '3-5', wave_quality: 6 },
  { name: 'Gordons Bay', ideal_swell_direction: '190-235', lower_swell_direction: '185-190', upper_swell_direction: '235-240', ideal_wave_force: '4-7', ideal_wind_direction: '70-130', lower_wind_direction: '60-70', upper_wind_direction: '130-140', ideal_tide: '3-5', wave_quality: 5 },
  { name: 'Strand', ideal_swell_direction: '190-235', lower_swell_direction: '185-190', upper_swell_direction: '235-240', ideal_wave_force: '2+', ideal_wind_direction: '70-130', lower_wind_direction: '60-70', upper_wind_direction: '130-140', ideal_tide: '3-5', wave_quality: 5 },
  { name: 'Muizenberg', ideal_swell_direction: '190-225', lower_swell_direction: '185-190', upper_swell_direction: '225-230', ideal_wave_force: '2-6', ideal_wind_direction: '280-30', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '3-5', wave_quality: 7 },
  { name: 'Dangers', ideal_swell_direction: '170-210', lower_swell_direction: '165-170', upper_swell_direction: '210-215', ideal_wave_force: '2-6', ideal_wind_direction: '280-31', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '3-5', wave_quality: 6 },
  { name: 'Kalk Bay Reef', ideal_swell_direction: '170-210', lower_swell_direction: '165-170', upper_swell_direction: '210-215', ideal_wave_force: '3-6', ideal_wind_direction: '280-33', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '3-5', wave_quality: 8 },
  { name: 'Black Rocks', ideal_swell_direction: '170-210', lower_swell_direction: '165-170', upper_swell_direction: '210-215', ideal_wave_force: '3-6', ideal_wind_direction: '280-33', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '3-5', wave_quality: 8 },
  { name: 'Dias Beach', ideal_swell_direction: '190-225', lower_swell_direction: '185-190', upper_swell_direction: '225-230', ideal_wave_force: '2-6', ideal_wind_direction: '280-34', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '3-5', wave_quality: 7 },
  { name: 'Platboom', ideal_swell_direction: '200-270', lower_swell_direction: '185-190', upper_swell_direction: '270-275', ideal_wave_force: '1-2', ideal_wind_direction: '280-35', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '1-2', wave_quality: 7.5 },
  { name: 'Extensions', ideal_swell_direction: '220-270', lower_swell_direction: '215-220', upper_swell_direction: '270-275', ideal_wave_force: '2.5-4.5', ideal_wind_direction: '90-146', lower_wind_direction: '80-90', upper_wind_direction: '146-156', ideal_tide: '3-5', wave_quality: 6.5 },
  { name: 'Scarborough', ideal_swell_direction: '205-270', lower_swell_direction: '200-205', upper_swell_direction: '270-275', ideal_wave_force: '2.5-4.5', ideal_wind_direction: '90-146', lower_wind_direction: '80-90', upper_wind_direction: '146-156', ideal_tide: '3-5', wave_quality: 5 },
  { name: 'Misty Cliffs', ideal_swell_direction: '205-270', lower_swell_direction: '200-205', upper_swell_direction: '270-275', ideal_wave_force: '2.5-4.5', ideal_wind_direction: '0-85', lower_wind_direction: '350-0', upper_wind_direction: '85-95', ideal_tide: '3-5', wave_quality: 6 },
  { name: 'Outer Kom', ideal_swell_direction: '205-270', lower_swell_direction: '200-205', upper_swell_direction: '270-275
