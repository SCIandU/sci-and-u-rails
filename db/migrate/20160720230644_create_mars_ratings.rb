class CreateMarsRatings < ActiveRecord::Migration
  def change
    create_table :mars_ratings do |t|
      t.string :platform

      t.integer :engagement1
      t.integer :engagement2
      t.integer :engagement3
      t.integer :engagement4
      t.integer :engagement5            

      t.integer :functionality1
      t.integer :functionality2
      t.integer :functionality3
      t.integer :functionality4    

      t.integer :aesthetics1
      t.integer :aesthetics2
      t.integer :aesthetics3  

      t.integer :information1
      t.integer :information2
      t.integer :information3
      t.integer :information4
      t.integer :information5  
      t.integer :information6
      t.integer :information7        

      t.integer :subjective1
      t.integer :subjective2
      t.integer :subjective3
      t.integer :subjective4                  

      t.integer :appspecific1
      t.integer :appspecific2
      t.integer :appspecific3
      t.integer :appspecific4  
      t.integer :appspecific5
      t.integer :appspecific6  

      t.text :feedback

      t.references :user	

      t.timestamps null: false
    end
  end
end
