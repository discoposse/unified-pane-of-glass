class InstanceReservation < ApplicationRecord
  belongs_to :reservation_owner
  belongs_to :reservable_instance
end
