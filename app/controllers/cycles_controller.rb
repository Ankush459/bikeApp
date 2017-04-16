require 'cycle_decorator'
class CyclesController < ApplicationController
  before_action :set_cycle, only: [:show, :edit, :update, :destroy]

  # GET /cycles
  # GET /cycles.json
  def index
    @cycles = Cycle.all
    if params[:search]
      @cycles= Cycle.search(params[:search]).order("created_at DESC")
    else
      @cycles= Cycle.all.order('created_at DESC')
    end
  end
  # GET /cycles/1
  # GET /cycles/1.json
  def show
  end

  # GET /cycles/new
  def new
    @cycle = Cycle.new
  end

  # GET /cycles/1/edit
  def edit
  end

  # POST /cycles
  # POST /cycles.json
  def create
@cycle = Cycle.new()
@cycle.firstname = params[:cycle][:firstname]
@cycle.lastname = params[:cycle][:lastname]
@cycle.color = params[:cycle][:color]
@cycle.destination = params[:cycle][:destination]
# create an instance/object of a BasicCar
myCycle = BasicCycle.new(2, @cycle.destination, @cycle.color)
# add the extra features to the new car
if params[:cycle][:windows].to_s.length > 0 then
myCycle = ElectricWindowsDecorator.new(myCycle)
end
if params[:cycle][:mirror].to_s.length > 0 then
myCycle = MirrorDecorator.new(myCycle)
end
if params[:cycle][:psensor].to_s.length > 0 then
myCycle = ParkingSensorDecorator.new(myCycle)
end
@cycle.cost = myCycle.cost


    respond_to do |format|
      if @cycle.save
        format.html { redirect_to @cycle, notice: 'Cycle was successfully created.' }
        format.json { render :show, status: :created, location: @cycle }
      else
        format.html { render :new }
        format.json { render json: @cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cycles/1
  # PATCH/PUT /cycles/1.json
  def update
    respond_to do |format|
      if @cycle.update(cycle_params)
        format.html { redirect_to @cycle, notice: 'Cycle was successfully updated.' }
        format.json { render :show, status: :ok, location: @cycle }
      else
        format.html { render :edit }
        format.json { render json: @cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cycles/1
  # DELETE /cycles/1.json
  def destroy
    @cycle.destroy
    respond_to do |format|
      format.html { redirect_to cycles_url, notice: 'Cycle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cycle
      @cycle = Cycle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cycle_params
      params.require(:cycle).permit(:firstname, :lastname, :destination, :cost, :color)
    end
end
