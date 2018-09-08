class ReservationOwner < ApplicationRecord
	validates :email, presence: true, uniqueness: true
	has_many :resevable_instances, :through => :instance_reservations
	has_many :instance_reservations, :dependent => :destroy
end
