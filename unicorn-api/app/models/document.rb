class Document < ApplicationRecord
  belongs_to :movements, optional: true
end
