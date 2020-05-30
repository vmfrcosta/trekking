class Package < ApplicationRecord
  belongs_to :origin
  belongs_to :destiny
  belongs_to :vacation
end
