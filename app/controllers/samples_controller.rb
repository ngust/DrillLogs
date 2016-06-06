class SamplesController < ApplicationController
  
  before_filter :load_hole

  def new
    @sample = @hole.samples.build
  end

  def create
    @sample = @hole.samples.build(sample_params)

    if @sample.save
      redirect_to @hole, notice: "Sample Log created successfully"
    else
      render :new
    end
  end

  def destroy
  end

  protected

  def load_hole
    @hole = Hole.find(params[:hole_id])
  end

  def sample_params
    params.require(:sample).permit(:from, :to, :rock_type, :discharge, :gold, :notes)
  end
end
