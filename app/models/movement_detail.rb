class MovementDetail < ApplicationRecord
  belongs_to :movement

  def self.create_from_params(params)
    entry = new
    entry.key = params[:key]
    entry.value = params[:value]
    entry
  end
end
