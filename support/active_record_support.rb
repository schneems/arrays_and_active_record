require 'active_record'

ActiveRecord::Base.establish_connection(
:adapter => "sqlite3",
:database => ":memory:",
:host     => 'localhost')

ActiveRecord::Schema.define do
  create_table :dealerships do |t|
    t.string :name
    t.timestamps
  end
  create_table :cars do |t|
    t.string :color
    t.string :condition
    t.integer :top_speed
    t.integer :dealership_id
    t.timestamps
  end
end

class Dealership < ActiveRecord::Base
  has_many :cars
end

class Car < ActiveRecord::Base
  CONDITION_ARRAY = ["bad", "ok", "great", "perfect"]
  COLOR_ARRAY     = ["red", "blue", "silver"]
  SPEEDS_ARRAY    = [1,2,3,4,5]
  belongs_to :dealership
end