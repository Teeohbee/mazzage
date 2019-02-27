class Guest
  include Mongoid::Document
  field :name, type: String
  field :attendance, type: Boolean
  field :message, type: String
  field :food_option, type: String
  field :dietary_requirements, type: String

  validates :name, presence: true

  def self.to_csv
    CSV.generate do |csv|
      csv << %w{ name attendance message food_option dietary_requirements }
      all.each do |guest|
        csv << [guest.name, guest.attendance, guest.message, guest.food_option, guest.dietary_requirements]
      end
    end
  end
end
