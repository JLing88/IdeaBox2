class CreateIdea < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :body
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
