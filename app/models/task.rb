class Task < ApplicationRecord
  belongs_to :employee

  validates_presence_of :name
end
