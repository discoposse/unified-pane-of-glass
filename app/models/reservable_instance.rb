class ReservableInstance < ApplicationRecord
	has_many :instance_reservations, :through => :instance_reservations
	has_many :instance_reservations, :dependent => :destroy
end
