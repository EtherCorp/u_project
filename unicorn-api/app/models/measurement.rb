class Measurement < ApplicationRecord
  belongs_to :metrics, optional: true
end
