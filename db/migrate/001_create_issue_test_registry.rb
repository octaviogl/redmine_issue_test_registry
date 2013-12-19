class CreateIssueTestRegistry < ActiveRecord::Migration
  def self.up
    create_table :issue_test_registries do |t|
      t.date :test_date
      t.string :test_environment
      t.integer :test_result
      t.references :issue, :null => false
    end
  end

  def self.down
    drop_table :issue_test_registry
  end
end