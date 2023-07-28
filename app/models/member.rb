class Member < ApplicationRecord
  belongs_to :head

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
