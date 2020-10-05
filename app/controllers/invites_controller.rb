class InvitesController < ApplicationController
  def create
    @attend = Invite.new
    @attend.user_id = current_user.id
    @attend.event_id =  params[:event_id]
    if @attend.valid? && @attend.save
      redirect_to events_path, notice: 'Event added to attending list'
    else
    end
  end
end
