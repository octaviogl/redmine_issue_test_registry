class IssueTestRegistryController < ApplicationController
  helper :issues

  before_filter :find_issue, :only => [:create]
  before_filter :find_test_registry, :only => [:destroy]
  before_filter :find_project_by_project_id, :authorize, :only => [:index]

  def index
    valid_trackers

    @issues = Issue.visible.all(:conditions => ["project_id = :project_id AND tracker_id IN (:tracker_ids)", {:project_id => @project.id, :tracker_ids => @trackers}])

    @tests_by_issue = {}
    if @issues.any?
      tests = IssueTestRegistry.all(
            :conditions => {:issue_id => @issues.map(&:id)},
            :order => "#{IssueTestRegistry.table_name}.issue_id, #{IssueTestRegistry.table_name}.test_environment ASC, #{IssueTestRegistry.table_name}.test_date ASC, #{IssueTestRegistry.table_name}.version ASC"
          )

      @tests_by_issue = tests.group_by(&:issue_id)

      @issues.reject! {|issue| @tests_by_issue[issue.id].blank? }
    end

  end

  def create

    saved = false
    if @issue.present? && !params[:test_registry].nil?
      @test_registry = IssueTestRegistry.new
      @test_registry.test_date = params[:test_registry][:test_date]
      @test_registry.test_environment = params[:test_registry][:test_environment]
      @test_registry.test_result = params[:test_registry][:test_result]
      @test_registry.version = params[:test_registry][:version]
      @test_registry.issue = @issue
      saved = @test_registry.save

      if(saved)
        @test_registry = IssueTestRegistry.new
      end
    end
    respond_to do |format|
      format.html { redirect_to issue_path(@issue) }
      format.js {
        @issue.reload.test_registry
      }
      format.api {
        if saved
          render :action => 'show', :status => :created, :location => relation_url(@relation)
        else
          render_validation_errors(@relation)
        end
      }
    end
  end

  def destroy
    if !@test_registry.nil?
      @test_registry.destroy
    end

    respond_to do |format|
      format.html { redirect_to issue_path(@test_registry.issue) }
      format.js
      format.api  { render_api_ok }
    end
  end

  private
  def find_issue
    @issue = @object = Issue.find(params[:issue_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def find_test_registry
    @test_registry = IssueTestRegistry.find(params[:test_registry_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def valid_trackers
    @trackers = Setting.plugin_redmine_issue_test_registry['test_registry_tracker']
  end

end
