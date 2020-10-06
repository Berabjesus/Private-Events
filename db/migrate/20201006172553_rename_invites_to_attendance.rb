class RenameInvitesToAttendance < ActiveRecord::Migration[6.0]
  def change
    rename_table :invites, :attendances
  end
end
