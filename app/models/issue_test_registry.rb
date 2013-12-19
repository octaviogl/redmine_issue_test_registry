class IssueTestRegistry < ActiveRecord::Base
  unloadable
  belongs_to :issue
  #belongs_to :author, :class_name => "User", :foreign_key => "author_id"

  validates_presence_of :test_date, :test_environment, :test_result

  def editable?(usr=User.current)
    usr && usr.allowed_to?(:manage_issue_test_registry, project)
  end

  def project
    self.issue.project if self.issue
  end

  def test_result_label
    if self.test_result.nil?
        ::I18n.t(:label_test_result_nil)
      elsif self.test_result == 0
        ::I18n.t(:label_test_result_nok)
      elsif self.test_result == 1
        ::I18n.t(:label_test_result_ok)
    end
  end


end

