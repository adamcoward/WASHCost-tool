class Advanced::WaterController < ApplicationController

  layout "tool_advanced"

  authorize_resource :class => Advanced::WaterController


  def begin
    @questionnaire = AdvancedWaterQuestionnaire.new( session )
    @questionnaire.reset

    redirect_to advanced_water_action_path( :context )
  end

  def questionnaire
    @questionnaire = AdvancedWaterQuestionnaire.new( session )

    render params[ :section ]
  end

  def update
    @questionnaire = AdvancedWaterQuestionnaire.new( session )

    # save updated questionnaire
    @questionnaire.update_attributes( params[ :advanced_water_questionnaire ] )

    redirect_to advanced_water_action_path( I18n.locale, params[ :section ] )
  end

  def report

  end

end
