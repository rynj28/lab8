class Subject < ApplicationRecord
  has_many :courses
  has_many :students, through: :courses
  belongs_to :teacher
end
