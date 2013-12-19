require 'redmine'

require 'redmine_issue_test_registry/redmine_issue_test_registry'

Redmine::Plugin.register :redmine_issue_test_registry do
  name 'Redmine Issue Test Registry plugin'
  author 'Octavio González'
  description 'This is a test registry plugin to Redmine Issues'
  version '1.0.0'
  url 'http://redmine.org'
  author_url 'mailto:ogonzalez@emergya.com'

  requires_redmine :version_or_higher => '2.0.0'

  settings :default => {
    :test_registry_tracker => 1
    #,:issue_done_ratio => false
  }, :partial => 'settings/issue_test_registry'

  menu :project_menu, :issue_test_registry, { :controller => 'issue_test_registry', :action => 'index' }, :caption => :label_test_registry_project, :param => :project_id #, :after => :activity

  project_module :issue_test_registry do |map|
    map.permission :view_test_registry, :issue_test_registry => :index
    map.permission :view_issue_test_registry, {}
    map.permission :manage_issue_test_registry, {:issue_test_registry => :destroy, :issue_test_registry => :create}
  end

end
