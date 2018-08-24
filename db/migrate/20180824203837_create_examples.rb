class CreateExamples < ActiveRecord::Migration[5.1]
  def change
    create_table :examples do |t|
      t.string :title
      t.text :summary
      t.references :provider, foreign_key: true
      t.integer :format
      t.text :payload

      t.timestamps
    end
  end
end
