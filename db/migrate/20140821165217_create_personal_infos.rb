class CreatePersonalInfos < ActiveRecord::Migration
  def change
    create_table :personal_infos do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :email

      t.timestamps
    end
  end
end
