
require 'redmine_issue_test_registry/hooks/views_issues_hook'
require 'redmine_issue_test_registry/hooks/model_issue_hook'

Rails.configuration.to_prepare do
 	require 'redmine_issue_test_registry/patches/issue_patch'
end

module RedmineIssueTestRegistry

  def self.settings()
    Setting[:plugin_redmine_issue_test_registry].blank? ? {} : Setting[:plugin_redmine_issue_test_registry]
  end

  # module Hooks
  #   class ViewLayoutsBaseHook < Redmine::Hook::ViewListener
  #     render_on :view_layouts_base_html_head, :inline => "<%= stylesheet_link_tag :contacts_invoices, :plugin => 'redmine_contacts_invoices' %>"
  #   end
  # end

end

