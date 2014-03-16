class AddFailedAttemptsLockedAtToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :failed_attempts, :integer
    add_column :admins, :locked_at, :datetime
  end
end
