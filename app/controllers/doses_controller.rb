class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params[dose_params])
    if @dose.save
      redirect_to dose_path(@dose.id)
    else
      render :new
    end
  end

  def edit
    @dose = Dose.find(params[:id])
  end

  def update
    if @dose.update(dose_params)
      redirect_to doses_path(@dose)
    else
      render :edit
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to dose_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
