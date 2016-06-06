class DrillLogsController < ApplicationController

  before_filter :load_hole

  def new
    # @hole = Hole.find(params[:hole_id])
    @drill_log = @hole.drill_logs.build
  end

  def create
    # @hole = Hole.find(params[:hole_id])
    @drill_log = @hole.drill_logs.build(drill_log_params)

    if @drill_log.save
      redirect_to @hole, notice: "Drill Log created successfully"
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

  def drill_log_params
    params.require(:drill_log).permit(:from, :to, :num_pails, :rock_type)
  end
end