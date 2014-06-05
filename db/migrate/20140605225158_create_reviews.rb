class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating

      t.timestamps
    end
    add_reference(:reviews, :product)
  end
end
