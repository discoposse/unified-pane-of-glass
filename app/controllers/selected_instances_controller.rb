class SelectedInstancesController < ApplicationController
  before_action :set_selected_instance, only: [:show, :edit, :update, :destroy]

  # GET /selected_instances
  # GET /selected_instances.json
  def index
    @selected_instances = SelectedInstance.all
  end

  # GET /selected_instances/1
  # GET /selected_instances/1.json
  def show
  end

  # GET /selected_instances/new
  def new
    @selected_instance = SelectedInstance.new
  end

  # GET /selected_instances/1/edit
  def edit
  end

  # POST /selected_instances
  # POST /selected_instances.json
  def create
    @selected_instance = SelectedInstance.new(selected_instance_params)

    respond_to do |format|
      if @selected_instance.save
        format.html { redirect_to @selected_instance, notice: 'Selected instance was successfully created.' }
        format.json { render :show, status: :created, location: @selected_instance }
      else
        format.html { render :new }
        format.json { render json: @selected_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selected_instances/1
  # PATCH/PUT /selected_instances/1.json
  def update
    respond_to do |format|
      if @selected_instance.update(selected_instance_params)
        format.html { redirect_to @selected_instance, notice: 'Selected instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @selected_instance }
      else
        format.html { render :edit }
        format.json { render json: @selected_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selected_instances/1
  # DELETE /selected_instances/1.json
  def destroy
    @selected_instance.destroy
    respond_to do |format|
      format.html { redirect_to selected_instances_url, notice: 'Selected instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selected_instance
      @selected_instance = SelectedInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selected_instance_params
      params.fetch(:selected_instance, {})
    end
end
