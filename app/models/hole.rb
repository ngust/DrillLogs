class Hole < ActiveRecord::Base

  has_many :drill_logs, dependent: :destroy 
  has_many :samples, dependent: :destroy 

   
  validates :ID,
    presence: true

  # validates :date,
  #   presence: true

  validates :lat, numericality: {greater_than_or_equal_to: -90,  \
  less_than_or_equal_to: 90 }
 
 validates :lng, numericality: { greater_than_or_equal_to: -180,  \
  less_than_or_equal_to: 180 }

  drill = "#{Rails.root}/public/DrillDataMay13.csv"
  
  drill = "/media/ng/DATA/GIS/HayesCreek2016/DrillData/DrillDataMay17.csv"

  def self.import(file)
    CSV.foreach(file) do |p|
      lat = p[3].to_f
      lng = p[4].to_f
      hole = p[0]
      theHole = Hole.exists?( ID: hole )
      puts hole
      puts theHole
      unless theHole
        test = Hole.new(ID: p[0], date: p[2], lat: lat, lng: lng)
        puts test.ID
        puts test.date
        puts test.lat
        puts test.lng
        puts "New entry!"
        test.save!
      end
    end
  end
end
