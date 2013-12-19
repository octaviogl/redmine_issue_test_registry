class AddVersionToIssueTestRegistry < ActiveRecord::Migration
  def self.up
    add_column :issue_test_registries, :version, :text
  end

  def self.down
    remove_column :issue_test_registries, :version
  end
end