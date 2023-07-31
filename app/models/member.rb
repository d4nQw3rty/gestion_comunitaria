class Member < ApplicationRecord
  belongs_to :head
  has_and_belongs_to_many :social_aids

  validates :name, presence: true
  validates :sur_name, presence: true  
  validates :phone_number, presence: true
  validates :relationship, presence: true

  def age
    today = Time.now.utc.to_date
    member_birthdate = self.member_birthdate.to_date
    age = today.year - member_birthdate.year
    age -= 1 if (member_birthdate.month > today.month || (member_birthdate.month == today.month && member_birthdate.day > today.day))
    age
  end

  def self.eligible_members(end_date)
    where("member_birthdate <= ?", end_date - 17.years).order("member_birthdate DESC")
  end
  
end
