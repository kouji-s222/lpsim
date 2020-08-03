class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.integer :total_income
      t.integer :saving
      t.integer :housing
      t.integer :transportation
      t.integer :event
      t.references :user, foreign_key: true
    end
  end
end
