class AddZipAndInterestToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :interest, :string
    add_column :subscriptions, :zip, :integer
  end
end
