class AddFailedAttemptsLockedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :failed_attempts, :inetger
    add_column :users, :locked_at, :datetime
  end
end
