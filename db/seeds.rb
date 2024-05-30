# db/seeds.rb

# Clear existing data to prevent duplicates
Spot.delete_all

# Create Users
User.create!(email: 'example@example.com', password: 'password', password_confirmation: 'password')

# Seed data for surf spots
spots_data = [
  { spot_name: 'Bettys Bay', ideal_swell_direction: '190-260', lower_swell_direction: '185-190', upper_swell_direction: '260-265', ideal_wave_force: 3.5, ideal_wind_direction: '330-60', lower_wind_direction: '60-70', upper_wind_direction: '320-330', ideal_tide: '1-2', wave_quality: 8 },
  { spot_name: 'Pringle Bay', ideal_swell_direction: '210-270', lower_swell_direction: '200-210', upper_swell_direction: '270-275', ideal_wave_force: '4-6', ideal_wind_direction: '100-160', lower_wind_direction: '90-100', upper_wind_direction: '160-170', ideal_tide: '1-2', wave_quality: 7 },
  { spot_name: 'Cool Bay', ideal_swell_direction: '190-270', lower_swell_direction: '185-190', upper_swell_direction: '270-275', ideal_wave_force: '1.5-2.5', ideal_wind_direction: '70-130', lower_wind_direction: '60-70', upper_wind_direction: '130-140', ideal_tide: '3-5', wave_quality: 6 },
  { spot_name: 'Gordons Bay', ideal_swell_direction: '190-235', lower_swell_direction: '185-190', upper_swell_direction: '235-240', ideal_wave_force: '4-7', ideal_wind_direction: '70-130', lower_wind_direction: '60-70', upper_wind_direction: '130-140', ideal_tide: '3-5', wave_quality: 5 },
  { spot_name: 'Strand', ideal_swell_direction: '190-235', lower_swell_direction: '185-190', upper_swell_direction: '235-240', ideal_wave_force: '2+', ideal_wind_direction: '70-130', lower_wind_direction: '60-70', upper_wind_direction: '130-140', ideal_tide: '3-5', wave_quality: 5 },
  { spot_name: 'Muizenberg', ideal_swell_direction: '190-225', lower_swell_direction: '185-190', upper_swell_direction: '225-230', ideal_wave_force: '2-6', ideal_wind_direction: '280-30', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '3-5', wave_quality: 7 },
  { spot_name: 'Dangers', ideal_swell_direction: '170-210', lower_swell_direction: '165-170', upper_swell_direction: '210-215', ideal_wave_force: '2-6', ideal_wind_direction: '280-31', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '3-5', wave_quality: 6 },
  { spot_name: 'Kalk Bay Reef', ideal_swell_direction: '170-210', lower_swell_direction: '165-170', upper_swell_direction: '210-215', ideal_wave_force: '3-6', ideal_wind_direction: '280-33', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '3-5', wave_quality: 8 },
  { spot_name: 'Black Rocks', ideal_swell_direction: '170-210', lower_swell_direction: '165-170', upper_swell_direction: '210-215', ideal_wave_force: '3-6', ideal_wind_direction: '280-33', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '3-5', wave_quality: 8 },
  { spot_name: 'Dias Beach', ideal_swell_direction: '190-225', lower_swell_direction: '185-190', upper_swell_direction: '225-230', ideal_wave_force: '2-6', ideal_wind_direction: '280-34', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '3-5', wave_quality: 7 },
  { spot_name: 'Platboom', ideal_swell_direction: '200-270', lower_swell_direction: '185-190', upper_swell_direction: '270-275', ideal_wave_force: '1-2', ideal_wind_direction: '280-35', lower_wind_direction: '30-40', upper_wind_direction: '270-280', ideal_tide: '1-2', wave_quality: 7.5 },
  { spot_name: 'Extensions', ideal_swell_direction: '220-270', lower_swell_direction: '215-220', upper_swell_direction: '270-275', ideal_wave_force: '2.5-4.5', ideal_wind_direction: '90-146', lower_wind_direction: '80-90', upper_wind_direction: '146-156', ideal_tide: '3-5', wave_quality: 6.5 },
  { spot_name: 'Scarborough', ideal_swell_direction: '205-270', lower_swell_direction: '200-205', upper_swell_direction: '270-275', ideal_wave_force: '2.5-4.5', ideal_wind_direction: '90-146', lower_wind_direction: '80-90', upper_wind_direction: '146-156', ideal_tide: '3-5', wave_quality: 5 },
  { spot_name: 'Misty Cliffs', ideal_swell_direction: '205-270', lower_swell_direction: '200-205', upper_swell_direction: '270-275', ideal_wave_force: '2.5-4.5', ideal_wind_direction: '0-85', lower_wind_direction: '350-0', upper_wind_direction: '85-95', ideal_tide: '3-5', wave_quality: 6 },
  { spot_name: 'Outer Kom', ideal_swell_direction: '205-270', lower_swell_direction: '200-205', upper_swell_direction: '270-275', ideal_wave_force: '2.5-4.5', ideal_wind_direction: '90-146', lower_wind_direction: '80-90', upper_wind_direction: '146-156', ideal_tide: '3-5', wave_quality: 6 },
  { spot_name: 'Glen Beach', ideal_swell_direction: '200-270', lower_swell_direction: '195-200', upper_swell_direction: '270-275', ideal_wave_force: '2-3', ideal_wind_direction: '90-146', lower_wind_direction: '80-97', upper_wind_direction: '146-162', ideal_tide: '1-3', wave_quality: 5.5 },
  { spot_name: 'Queens Beach', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '1.5-2.5', ideal_wind_direction: '90-146', lower_wind_direction: '80-98', upper_wind_direction: '146-163', ideal_tide: '3-5', wave_quality: 4.5 },
  { spot_name: 'Sollys', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '1.5-2.5', ideal_wind_direction: '90-146', lower_wind_direction: '80-99', upper_wind_direction: '146-164', ideal_tide: '3-5', wave_quality: 4 },
  { spot_name: 'Off the Wall', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '2-4', ideal_wind_direction: '90-146', lower_wind_direction: '80-100', upper_wind_direction: '146-165', ideal_tide: '3-5', wave_quality: 7 },
  { spot_name: 'Thermos', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '3-5', ideal_wind_direction: '90-146', lower_wind_direction: '80-101', upper_wind_direction: '146-166', ideal_tide: '3-5', wave_quality: 8 },
  { spot_name: 'Derdesteen', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '2-4', ideal_wind_direction: '0-100', lower_wind_direction: '350-0', upper_wind_direction: '100-110', ideal_tide: '3-5', wave_quality: 8 },
  { spot_name: 'Elands Bay', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '2-5', ideal_wind_direction: '90-146', lower_wind_direction: '80-90', upper_wind_direction: '146-156', ideal_tide: '3-5', wave_quality: 9 },
  { spot_name: 'Inner Kom', ideal_swell_direction: '200-205', lower_swell_direction: '200-205', upper_swell_direction: '270-275', ideal_wave_force: '2.5-4.5', ideal_wind_direction: '90-146', lower_wind_direction: '80-91', upper_wind_direction: '146-156', ideal_tide: '3-5', wave_quality: 5 },
  { spot_name: 'Long Beach', ideal_swell_direction: '205-270', lower_swell_direction: '200-205', upper_swell_direction: '270-275', ideal_wave_force: '2.5-5', ideal_wind_direction: '90-146', lower_wind_direction: '80-92', upper_wind_direction: '146-157', ideal_tide: '1-2', wave_quality: 7 },
  { spot_name: 'Dunes', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '2.5-4.5', ideal_wind_direction: '90-146', lower_wind_direction: '80-93', upper_wind_direction: '146-158', ideal_tide: '1-2', wave_quality: 9 },
  { spot_name: 'Hoek', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '2-3.5', ideal_wind_direction: '90-146', lower_wind_direction: '80-94', upper_wind_direction: '146-159', ideal_tide: '1-2', wave_quality: 7 },
  { spot_name: 'Sandy Bay', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '3-4.5', ideal_wind_direction: '90-146', lower_wind_direction: '80-95', upper_wind_direction: '146-160', ideal_tide: '1-2', wave_quality: 8 },
  { spot_name: 'Llandudno', ideal_swell_direction: '215-270', lower_swell_direction: '210-215', upper_swell_direction: '270-275', ideal_wave_force: '1.8-3', ideal_wind_direction: '90-146', lower_wind_direction: '80-96', upper_wind_direction: '146-161', ideal_tide: '1-2', wave_quality: 7 },
  { spot_name: 'Glen Beach', ideal_swell_direction: '200-270', lower_swell_direction: '195-200', upper_swell_direction: '270-275', ideal_wave_force: '2-3', ideal_wind_direction: '90-146', lower_wind_direction: '80-97', upper_wind_direction: '146-162', ideal_tide: '1-3', wave_quality: 5.5 }
  ]

    spots_data.each do |spot|
      Spot.create!(
        spot_name: spot[:spot_name],
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
