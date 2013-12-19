require_dependency 'issue'

module RedmineIssueTestRegistry
  module Patches

    module IssuePatch

      def self.included(base) # :nodoc:
        base.class_eval do
          unloadable # Send unloadable so it will not be unloaded in development

          has_many :test_registry, :class_name => "IssueTestRegistry", :dependent => :destroy, :order => "#{IssueTestRegistry.table_name}.test_environment ASC, #{IssueTestRegistry.table_name}.test_date ASC, #{IssueTestRegistry.table_name}.version ASC"
        end

      end

    end

  end
end


unless Issue.included_modules.include?(RedmineIssueTestRegistry::Patches::IssuePatch)
  Issue.send(:include, RedmineIssueTestRegistry::Patches::IssuePatch)
end