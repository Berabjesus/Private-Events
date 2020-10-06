class AttendancesController < ApplicationController
  def create
    @attend = Attendance.new
    @attend.user_id = current_user.id
    @attend.event_id =  params[:event_id]
    if @attend.valid? && @attend.save
      redirect_to events_path, notice: 'Event added to attending list'
    end
  end

  def destroy
    @attend = Attendance.find_by(event_id: params[:id])
    # @attend.user_id = current_user.id
    # @attend.event_id =  params[:event_id]
    if @attend.valid? && @attend.destroy
      redirect_to events_path, notice: 'Event removed from attending list'
    end
  end
end
