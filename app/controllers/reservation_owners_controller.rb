class ReservationOwnersController < ApplicationController
  before_action :set_reservation_owner, only: [:show, :edit, :update, :destroy]

  # GET /reservation_owners
  # GET /reservation_owners.json
  def index
    @reservation_owners = ReservationOwner.all
  end

  # GET /reservation_owners/1
  # GET /reservation_owners/1.json
  def show
  end

  # GET /reservation_owners/new
  def new
    @reservation_owner = ReservationOwner.new
  end

  # GET /reservation_owners/1/edit
  def edit
  end

  # POST /reservation_owners
  # POST /reservation_owners.json
  def create
    @reservation_owner = ReservationOwner.new(reservation_owner_params)

    respond_to do |format|
      if @reservation_owner.save
        format.html { redirect_to @reservation_owner, notice: 'Reservation owner was successfully created.' }
        format.json { render :show, status: :created, location: @reservation_owner }
      else
        format.html { render :new }
        format.json { render json: @reservation_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservation_owners/1
  # PATCH/PUT /reservation_owners/1.json
  def update
    respond_to do |format|
      if @reservation_owner.update(reservation_owner_params)
        format.html { redirect_to @reservation_owner, notice: 'Reservation owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation_owner }
      else
        format.html { render :edit }
        format.json { render json: @reservation_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservation_owners/1
  # DELETE /reservation_owners/1.json
  def destroy
    @reservation_owner.destroy
    respond_to do |format|
      format.html { redirect_to reservation_owners_url, notice: 'Reservation owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation_owner
      @reservation_owner = ReservationOwner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_owner_params
      params.require(:reservation_owner).permit(:firstname, :lastname, :email)
    end
end
