class Sample < ActiveRecord::Base
  belongs_to :hole

  validates :hole,
        presence: true

  validates :from,
        numericality: { only_integer: true }

  validates :to,
        numericality: { only_integer: true }

  validates :rock_type,
        presence: true

end
