class CreateGenomes < ActiveRecord::Migration
  def change
    create_table :genomes do |t|
      t.string :name

      t.timestamps
    end
  end
end
