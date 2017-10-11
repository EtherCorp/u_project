class ConnectionToken < ApplicationRecord
  belongs_to :medical_centers, optional: true
end
