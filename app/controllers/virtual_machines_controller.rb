class VirtualMachinesController < ApplicationController
  before_action :set_virtual_machine, only: [:show, :edit, :update, :destroy, :start_vm, :stop_vm]

  def index

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
    vm_url = ENV["RAILS_VCENTER_URL"] + "/rest/vcenter/vm"

    @vmresults = HTTParty.get(vm_url, 
      :headers => { 'Content-Type' => 'application/json',
                    'vmware-api-session-id' => vctoken }, 
      :verify => false)
  end

  def show
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
    # Create the URL which gets the VM details by concatenating the vCenter + url + VM id
    detail_url = ENV["RAILS_VCENTER_URL"] + "/rest/vcenter/vm/" + (params[:id])
    # Keep the VM ID to pass to the start and stop actions
    @vm_id = (params[:id])
    # Get the details from the API
    @vmdetails = HTTParty.get(detail_url, 
      :headers => { 'Content-Type' => 'application/json',
                    'vmware-api-session-id' => vctoken}, 
      :verify => false) 

    # Convert output to string and parse
    @p = JSON.parse(@vmdetails.to_s)
    #Flatten the JSON hash
    @flatdetails = @p.flatten(4)
    # Now we can get stuff from it starting with disk details
    @diskdetails = @flatdetails[1]["disks"].flatten(4)
  end

  def start_vm
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
    # Create the URL which gets the VM details by concatenating the vCenter + url + VM id
    start_url = ENV["RAILS_VCENTER_URL"] + "/rest/vcenter/vm/" + (params[:id]) + "/power/start"

    @vm_start_results = HTTParty.post(start_url, 
      :headers => { 'Content-Type' => 'application/json',
                    'vmware-api-session-id' => vctoken}, 
      :verify => false) 

    redirect_to virtual_machines_url, notice: "#{start_url} was sent"
  end

  def stop_vm
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
    # Create the URL which gets the VM details by concatenating the vCenter + url + VM id
    stop_url = ENV["RAILS_VCENTER_URL"] + "/rest/vcenter/vm/" + (params[:id]) + "/power/stop"

    @vm_stop_results = HTTParty.post(stop_url, 
      :headers => { 'Content-Type' => 'application/json',
                    'vmware-api-session-id' => vctoken}, 
      :verify => false) 

    redirect_to virtual_machines_url, notice: "#{stop_url} was sent"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_virtual_machine
      #@virtual_machine = VirtualMachine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def virtual_machine_params
      params.fetch(:virtual_machine, {})
    end
end
