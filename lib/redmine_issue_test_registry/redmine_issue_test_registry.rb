
require 'redmine_issue_test_registry/hooks/views_issues_hook'

Rails.configuration.to_prepare do
 	require 'redmine_issue_test_registry/patches/issue_patch'
end

module RedmineIssueTestRegistry

  def self.settings()
    Setting[:plugin_redmine_issue_test_registry].blank? ? {} : Setting[:plugin_redmine_issue_test_registry]
  end

end

