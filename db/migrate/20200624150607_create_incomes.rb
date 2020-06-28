class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.integer :total_income
      t.integer :income_tax	
      t.integer :living
      t.integer :housing
      t.integer :transportation
      t.integer :education
      t.integer :insurance
      t.integer :event
    end
  end
end
