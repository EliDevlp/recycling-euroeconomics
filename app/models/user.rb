class User < ApplicationRecord
  has_one :analysis, dependent: :destroy
end
