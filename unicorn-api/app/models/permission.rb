class Permission < ApplicationRecord
  has_and_belongs_to_many :accesses
  belongs_to :patients, optional: true
  belongs_to :professionals, optional: true
end
