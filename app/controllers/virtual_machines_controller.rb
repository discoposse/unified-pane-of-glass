class VirtualMachinesController < ApplicationController
  before_action :set_virtual_machine, only: [:show, :edit, :update, :destroy]

  # GET /virtual_machines
  # GET /virtual_machines.json
  def index
    @virtual_machines = VirtualMachine.all
  end

  # GET /virtual_machines/1
  # GET /virtual_machines/1.json
  def show
  end

  # GET /virtual_machines/new
  def new
    @virtual_machine = VirtualMachine.new
  end

  # GET /virtual_machines/1/edit
  def edit
  end

  # POST /virtual_machines
  # POST /virtual_machines.json
  def create
    @virtual_machine = VirtualMachine.new(virtual_machine_params)

    respond_to do |format|
      if @virtual_machine.save
        format.html { redirect_to @virtual_machine, notice: 'Virtual machine was successfully created.' }
        format.json { render :show, status: :created, location: @virtual_machine }
      else
        format.html { render :new }
        format.json { render json: @virtual_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /virtual_machines/1
  # PATCH/PUT /virtual_machines/1.json
  def update
    respond_to do |format|
      if @virtual_machine.update(virtual_machine_params)
        format.html { redirect_to @virtual_machine, notice: 'Virtual machine was successfully updated.' }
        format.json { render :show, status: :ok, location: @virtual_machine }
      else
        format.html { render :edit }
        format.json { render json: @virtual_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /virtual_machines/1
  # DELETE /virtual_machines/1.json
  def destroy
    @virtual_machine.destroy
    respond_to do |format|
      format.html { redirect_to virtual_machines_url, notice: 'Virtual machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_virtual_machine
      @virtual_machine = VirtualMachine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def virtual_machine_params
      params.fetch(:virtual_machine, {})
    end
end
