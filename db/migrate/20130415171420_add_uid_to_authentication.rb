class AddUidToAuthentication < ActiveRecord::Migration
  def change
    change_table :authentications do |t|
      t.string :uid
    end
  end
end
