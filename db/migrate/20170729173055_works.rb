class Works < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.references :user
      t.string :name
      t.datetime :date
      t.string :post
    end
  end
end
