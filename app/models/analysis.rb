class Analysis < ApplicationRecord
  belongs_to :user
  has_many :bins
end
