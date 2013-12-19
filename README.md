IssueTestRegistry Plugin
===========================

IssueTestRegistry is a Redmine Plugin to create a Test Registry based on Issues. It allows to register test executions of issues.

== Features

* Settings: Tracker multiple selection to allow test registration.
* Permissions: Configurable through Administration.
  > View Issue Test Registry: It allows to view the test registry of the project (by the Project Menu).
  > View Issue Test Registry: It allows to view the test registry of an issue.
  > Manage Issue Test Registry: It allows to add and remove test executions of issues. The fields of a test execution are: Test Date, Version, Test Environment and Result (It depends on previous permission).
* Project: It is made as a project module, so can be enabled/disabled project by project.

== Getting the plugin

{Github}[https://github.com/octaviogl/redmine_issue_test_registry.git]

== Install

1. The plugin has been tested on Redmine 2.3, but it was made following the Plugin Tutorial for Redmine 2.X.
2. Copy the plugin into the plugins folder of your Redmine installation.
3. Execute the plugin migration to create the table in the database (add RAILS_ENV variable if necessary): rake db:migrate:plugin NAME=redmine_cmi
4. Restart your Redmine server.
5. Configure the plugin to select the trackers (Administration/Plugins) and enable the project module in the desired ones.

== Uninstall

1. Execute migration (add RAILS_ENV variable if necessary): rake db:migrate:plugin NAME=redmine_cmi VERSION=0
2. Remove the folder from your plugins folder.

