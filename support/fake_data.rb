require 'ffaker'

100.times do
  dealership = Dealership.create(:name => Faker::Company.name)
  6.times do
    dealership.cars.create(:color     => Car::COLOR_ARRAY.sample, 
                           :condition => Car::CONDITION_ARRAY.sample,
                           :top_speed => Car::SPEEDS_ARRAY.sample )
  end
end

2.times do
  Car.create(:color     => Car::COLOR_ARRAY.sample, 
             :condition => Car::CONDITION_ARRAY.sample,
             :top_speed => Car::SPEEDS_ARRAY.sample )
end

2.times do
  Dealership.create(:name => Faker::Company.name)
end