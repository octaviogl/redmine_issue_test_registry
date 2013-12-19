RedmineApp::Application.routes.draw do

  match '/projects/:project_id/issue_test_registry/:action' => 'issue_test_registry', :as => :issue_test_registry

  match '/issue_test_registry/create' => 'issue_test_registry#create'
  match '/issue_test_registry/destroy' => 'issue_test_registry#destroy'

end