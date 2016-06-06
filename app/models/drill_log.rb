class DrillLog < ActiveRecord::Base
  belongs_to :hole

  validates :hole_id,
        presence: true

  validates :from,
        numericality: { only_integer: true }

  validates :to,
        numericality: { only_integer: true }

  validates :num_pails,
        numericality: { only_integer: true }

  validates :rock_type,
        presence: true

  drill = "#{Rails.root}/public/DrillDataMay13.csv"

  def self.import(file)
    CSV.foreach(file) do |p|
      from = p[5].to_i
      to = p[6].to_i
      pails = p[8].to_i
      hole = p[0]
      theHole = Hole.where( ID: hole )
      hole_id = theHole[0].id
      if p[9]
        test = DrillLog.new(hole_id: hole_id, from: from, to: to, num_pails: pails, rock_type: p[9])
        puts test.hole_id
        puts test.from
        puts test.to
        puts test.rock_type
        puts "New entry!"
        test.save!
      end
    end
  end
end
