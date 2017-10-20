class Access < ApplicationRecord
  has_and_belongs_to_many :permissions
end
