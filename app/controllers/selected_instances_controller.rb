class SelectedInstancesController < ApplicationController
  before_action :set_selected_instance, only: [:show, :edit, :update, :destroy]

  def index
    upog_config = Rails.application.config_for(:upog)

    @selected_instance_filter = Rails.application.config.x.upog.selected_instance_filter = upog_config['selected_instance_filter']

    # Create the session URL by oncatenating hte vCenter URL + the session path
    vcenter_session_url = ENV["RAILS_VCENTER_URL"] + "/rest/com/vmware/cis/session"
    # get a token bu passing basic auth to the cis/session path
    authtokenrequest = HTTParty.post(vcenter_session_url,
      headers: {'Content-Type' => 'application/json',
                  'vmware-use-header-authn' => 'BASIC'},
      basic_auth: { username: ENV["RAILS_VCENTER_USER"],
                      password: ENV["RAILS_VCENTER_PASS"] },
      :verify => false)

    # Pull the token from the JSON result
    vctoken = authtokenrequest["value"]
    # Create the URL which gets the VM list by concatenating the vCenter + url path
    vm_url = ENV["RAILS_VCENTER_URL"] + "/rest/vcenter/vm" + "?filter.names=" + @selected_instance_filter

    @selected_vm_results = HTTParty.get(vm_url, 
      :headers => { 'Content-Type' => 'application/json',
                    'vmware-api-session-id' => vctoken }, 
      :verify => false)
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selected_instance
      # @selected_instance = SelectedInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selected_instance_params
      params.fetch(:selected_instance, {})
    end
end
