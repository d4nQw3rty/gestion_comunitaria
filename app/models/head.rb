class Head < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_full_name, 
                  against: [:name, :sur_name], 
                  using: {tsearch: {prefix: true}}

  belongs_to :user

  has_many :members, dependent: :destroy

  def age
    today = Time.now.utc.to_date
    birthdate = self.birthdate.to_date
    age = today.year - birthdate.year
    age -= 1 if (birthdate.month > today.month || (birthdate.month == today.month && birthdate.day > today.day))
    age
  end

  def self.eligible_heads(end_date)
    where("birthdate <= ?", end_date - 17.years).order("birthdate DESC")
  end

end
