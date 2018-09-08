class InstanceReservationsController < ApplicationController
  before_action :set_instance_reservation, only: [:show, :edit, :update, :destroy]

  # GET /instance_reservations
  # GET /instance_reservations.json
  def index
    @instance_reservations = InstanceReservation.all
  end

  # GET /instance_reservations/1
  # GET /instance_reservations/1.json
  def show
  end

  # GET /instance_reservations/new
  def new
    @instance_reservation = InstanceReservation.new
  end

  # GET /instance_reservations/1/edit
  def edit
  end

  # POST /instance_reservations
  # POST /instance_reservations.json
  def create
    @instance_reservation = InstanceReservation.new(instance_reservation_params)

    respond_to do |format|
      if @instance_reservation.save
        format.html { redirect_to @instance_reservation, notice: 'Instance reservation was successfully created.' }
        format.json { render :show, status: :created, location: @instance_reservation }
      else
        format.html { render :new }
        format.json { render json: @instance_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instance_reservations/1
  # PATCH/PUT /instance_reservations/1.json
  def update
    respond_to do |format|
      if @instance_reservation.update(instance_reservation_params)
        format.html { redirect_to @instance_reservation, notice: 'Instance reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @instance_reservation }
      else
        format.html { render :edit }
        format.json { render json: @instance_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instance_reservations/1
  # DELETE /instance_reservations/1.json
  def destroy
    @instance_reservation.destroy
    respond_to do |format|
      format.html { redirect_to instance_reservations_url, notice: 'Instance reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance_reservation
      @instance_reservation = InstanceReservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instance_reservation_params
      params.require(:instance_reservation).permit(:reservation_owner_id, :reservable_instance_id)
    end
end
