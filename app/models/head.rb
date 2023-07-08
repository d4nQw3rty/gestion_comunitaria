class Head < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_full_name, 
                  against: [:name, :sur_name], 
                  using: {tsearch: {prefix: true}}

  belongs_to :user
end
