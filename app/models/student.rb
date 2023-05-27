class Student < ApplicationRecord
  has_many :courses
  has_many :subjects, through: :courses
  has_many :teachers, through: :subjects
end
