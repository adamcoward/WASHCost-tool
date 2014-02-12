class Advanced::SanitationController < CalculatorController

  layout 'tool_advanced'

  authorize_resource :class => Advanced::SanitationController
  load_and_authorize_resource UserReport, :only => [ :save_report, :store_report ]


  def begin
    @questionnaire = AdvancedSanitationQuestionnaire.new( session )
    @questionnaire.reset

    redirect_to advanced_sanitation_action_path( I18n.locale, :service_area )
  end

  def questionnaire
    @questionnaire = AdvancedSanitationQuestionnaire.new( session )

    render params[ :section ]
  end

  def update
    @questionnaire = AdvancedSanitationQuestionnaire.new( session )

    # save updated questionnaire
    @questionnaire.update_attributes( params[ :advanced_sanitation_questionnaire ] )

    redirect_to advanced_sanitation_action_path( I18n.locale, params[ :section ] )
  end

  def dynamic_update
    @questionnaire = AdvancedSanitationQuestionnaire.new( session )

    # save updated questionnaire
    @questionnaire.update_attributes( params[ :advanced_sanitation_questionnaire ] )

    render json: { :progress => @questionnaire.complete }
  end

  def report
    @questionnaire = AdvancedSanitationQuestionnaire.new( session )

    render layout: 'report'
  end

  def save_report
    @report = UserReport.new

    render layout: 'general', template: 'shared/save_report'
  end

  def share_report
    @report = Report.create( :level => 'advanced', :type => 'sanitation', :questionnaire => AdvancedSanitationQuestionnaire.new( session ).attributes )
    @back_path = advanced_sanitation_report_path( I18n.locale )

    render layout: 'general', template: 'shared/share_report'
  end

  def store_report
    super( params[ :user_report ][ :title ], 'advanced', 'sanitation', AdvancedSanitationQuestionnaire.new( session ).attributes )
  end

end
