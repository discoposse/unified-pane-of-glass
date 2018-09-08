class ReservableInstancesController < ApplicationController
  before_action :set_reservable_instance, only: [:show, :edit, :update, :destroy]

  # GET /reservable_instances
  # GET /reservable_instances.json
  def index
    @reservable_instances = ReservableInstance.all
  end

  # GET /reservable_instances/1
  # GET /reservable_instances/1.json
  def show
  end

  # GET /reservable_instances/new
  def new
    @reservable_instance = ReservableInstance.new
  end

  # GET /reservable_instances/1/edit
  def edit
  end

  # POST /reservable_instances
  # POST /reservable_instances.json
  def create
    @reservable_instance = ReservableInstance.new(reservable_instance_params)

    respond_to do |format|
      if @reservable_instance.save
        format.html { redirect_to @reservable_instance, notice: 'Reservable instance was successfully created.' }
        format.json { render :show, status: :created, location: @reservable_instance }
      else
        format.html { render :new }
        format.json { render json: @reservable_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservable_instances/1
  # PATCH/PUT /reservable_instances/1.json
  def update
    respond_to do |format|
      if @reservable_instance.update(reservable_instance_params)
        format.html { redirect_to @reservable_instance, notice: 'Reservable instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservable_instance }
      else
        format.html { render :edit }
        format.json { render json: @reservable_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservable_instances/1
  # DELETE /reservable_instances/1.json
  def destroy
    @reservable_instance.destroy
    respond_to do |format|
      format.html { redirect_to reservable_instances_url, notice: 'Reservable instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservable_instance
      @reservable_instance = ReservableInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservable_instance_params
      params.require(:reservable_instance).permit(:name, :vm)
    end
end
