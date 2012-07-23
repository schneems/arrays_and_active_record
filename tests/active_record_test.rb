require "test/unit"
require 'ffaker'

require_relative "../support/active_record_support"

def create_car(options = {})
  options[:color]     ||=  Car::COLOR_ARRAY.sample
  options[:condition] ||=  Car::CONDITION_ARRAY.sample
  options[:top_speed] ||=  Car::SPEEDS_ARRAY.sample

  Car.create(:color     => options[:color],
             :condition => options[:condition],
             :top_speed => options[:top_speed])
end



class ActiveRecordTest < Test::Unit::TestCase

  # Use where method assign variable to a dealership with the same name "Fake Name"
  # assign to variable `dealership`
  def test_regular_where
    dealership = nil
    name = "Fake Name"
    d    = Dealership.create(:name => name)
    # put your code here
    assert_equal d, dealership
  end


  # Group and count all the cars with the color "cheetah"
  # use the group and count methods, assign your output to the variable `color_group`
  # use the `group` & `count` methods
  # assign to variable `color_group`
  def test_select
    color_group = {}
    cars = []
    3.times do
      cars << Car.create(:color => "cheetah")
    end
    # put your code here
    assert_equal Car.where(:color => "cheetah").count, color_group["cheetah"]
  end

  # Use the `LIKE` operator in SQL to find all cars with conditions that contain "good"
  # assign to `your_cars` variable
  def test_like
    your_cars = []
    cars = []
    cars << Car.create(:condition => "goodish")
    cars << Car.create(:condition => "very good")
    cars << Car.create(:condition => "not so good")
    Car.create(:condition => "straight up bad")
    # put your code here
    assert_equal cars, your_cars
  end


  # find all the dealerships with given id's use the IN keyword in SQL
  # you can drop to SQL in a where using (?) syntax : ('something = (?)', variable)
  # the variable of `ids` holds an array of all of the dealership's id's
  # assign to variable dealerships
  def test_in
    dealerships = nil
    dealerz = 3.times.map { Dealership.create(:name => Faker::Company.name) }
    ids     = dealerz.map {|d| d.id }
    # put your code here
    assert_equal dealerz, dealerships
  end


  # Find all the cars of a given color in reverse order by created_at using the `order()` method
  # remember time is ever increasing in a positive direction, how do you want to order ASC or DESC?
  # assign to a variable reverse_cars
  def test_order
    reverse_cars = []
    cars = 5.times.map {Car.create}
    # put your code here
    assert_equal cars.reverse, reverse_cars
  end


  # find the first 4 cars
  # assign to variable `limited_cars`
  def test_limit
    limited_cars = nil
    cars = 5.times.map { Car.create }
    # put your code here
    assert_equal cars.first(4), limited_cars
  end

  # find the second and third cars, using offset and limit methods
  # assign to variable `offset_cars`
  def test_offset
    offset_cars = nil
    cars = 5.times.map {Car.create}
    # put your code here
    assert_equal cars[1,2], offset_cars
  end



  # Find all dealerships that have a car colored "red", assign to a variable dealerships
  # use joins
  # assign to variable `dealerships`
  def test_joins
    dealerships = nil
    dealerz = []
    3.times do
      d = Dealership.create(:name => Faker::Company.name)
      d.cars.create(:color => "red")
      dealerz << d
    end
    d = Dealership.create(:name => Faker::Company.name)
    d.cars.create(:color => "blue")
    # put your code here
    assert_equal dealerz, dealerships
  end


  # Use the #having operator to find all the dealerships that have cars of an average top speed of 5 or more
  # to get you started the join and group statements are included below, just
  # fill out the having statement
  # use AVG() function in SQL to average values
  # use >= for a greater than or equal comparison
  # assign to variable `dealerships`
  def test_having
    dealerships = []
    dealerz = []
    color = "liger yellow"
    3.times do
      d = Dealership.create(:name => Faker::Company.name)
      d.cars.create(:color => color, :top_speed => 5)
      dealerz << d
    end
    d  = Dealership.create(:name => Faker::Company.name)
    d.cars.create(:color => color, :top_speed => 2)
    # put your code here
    dealerships = Dealership.joins(:cars).group("dealerships.id, cars.top_speed").having("")
    assert_equal dealerz, dealerships.all
  end

end
