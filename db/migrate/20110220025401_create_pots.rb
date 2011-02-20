class CreatePots < ActiveRecord::Migration
  def self.up
    create_table :pots do |t|
      t.string      :pot_code, :name
      t.integer     :capacity, :cups_left
      t.timestamps
    end
  end

  def self.down
    drop_table :pots
  end
end
