class CreateIeStatements < ActiveRecord::Migration[7.1]
  def change
    create_table :ie_statements do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :income
      t.decimal :expenditure
      t.decimal :disposable_income
      t.string :rating

      t.timestamps
    end
  end
end
