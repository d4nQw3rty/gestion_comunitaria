class Member < ApplicationRecord
  belongs_to :head
  has_and_belongs_to_many :social_aids

  validates :name, presence: true
  validates :sur_name, presence: true  
  validates :phone_number, presence: true
  validates :relationship, presence: true

  def age
    today = Time.now.utc.to_date
    birthdate = self.birthdate.to_date
    age = today.year - birthdate.year
    age -= 1 if (birthdate.month > today.month || (birthdate.month == today.month && birthdate.day > today.day))
    age
  end

  def self.eligible_members(end_date)
    where("birthdate <= ?", end_date - 17.years).order("birthdate DESC")
  end
end
