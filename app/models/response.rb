class Response
  include Mongoid::Document
  field :full_name, type: String
  field :food_option, type: String
  field :notes, type: String
end
