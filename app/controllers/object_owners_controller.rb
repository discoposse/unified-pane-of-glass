class ObjectOwnersController < ApplicationController
  before_action :set_object_owner, only: [:show, :edit, :update, :destroy]

  # GET /object_owners
  # GET /object_owners.json
  def index
    @object_owners = ObjectOwner.all
  end

  # GET /object_owners/1
  # GET /object_owners/1.json
  def show
  end

  # GET /object_owners/new
  def new
    @object_owner = ObjectOwner.new
  end

  # GET /object_owners/1/edit
  def edit
  end

  # POST /object_owners
  # POST /object_owners.json
  def create
    @object_owner = ObjectOwner.new(object_owner_params)

    respond_to do |format|
      if @object_owner.save
        format.html { redirect_to @object_owner, notice: 'Object owner was successfully created.' }
        format.json { render :show, status: :created, location: @object_owner }
      else
        format.html { render :new }
        format.json { render json: @object_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /object_owners/1
  # PATCH/PUT /object_owners/1.json
  def update
    respond_to do |format|
      if @object_owner.update(object_owner_params)
        format.html { redirect_to @object_owner, notice: 'Object owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @object_owner }
      else
        format.html { render :edit }
        format.json { render json: @object_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /object_owners/1
  # DELETE /object_owners/1.json
  def destroy
    @object_owner.destroy
    respond_to do |format|
      format.html { redirect_to object_owners_url, notice: 'Object owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_object_owner
      @object_owner = ObjectOwner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def object_owner_params
      params.require(:object_owner).permit(:firstname, :lastname, :email)
    end
end
