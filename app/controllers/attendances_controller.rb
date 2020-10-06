# frozen_string_literal: true

class AttendancesController < ApplicationController
  def create
    @attend = Attendance.new
    @attend.user_id = current_user.id
    @attend.event_id = params[:event_id]
    redirect_to events_path, notice: 'Event added to attending list' if @attend.valid? && @attend.save
  end

  def destroy
    @attend = Attendance.find_by(event_id: params[:id])
    redirect_to events_path, notice: 'Event removed from attending list' if @attend.valid? && @attend.destroy
  end
end
