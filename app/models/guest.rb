class Guest
  include Mongoid::Document
  field :name, type: String
  field :food_option, type: String
  field :dietary_requirements, type: String
end