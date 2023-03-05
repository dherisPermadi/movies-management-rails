class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string   :title, index: true, null: false
      t.string   :description
      t.float    :rating, default: 0
      t.string   :image, default: ''
      t.timestamps
    end
  end
end
