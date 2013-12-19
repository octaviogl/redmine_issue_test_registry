module RedmineIssueTestRegistry
  module Hooks
    class ViewsIssuesHook < Redmine::Hook::ViewListener
      render_on :view_issues_show_description_bottom, :partial => "issues/test_registry"
    end
  end
end
