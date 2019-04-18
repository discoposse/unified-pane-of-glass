module ApplicationHelper

	def vcenter
		# Set the safety measure to prevent restarting/stopping vCenter
    	# Get the vCenter name to use in other parts of the app
		vcenter = ENV["RAILS_VCENTER_NAME"]
	end
end
