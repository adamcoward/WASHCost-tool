class SanitationBasicController < ApplicationController

  after_filter :set_percent_complete

  include SanitationBasicHelper

  layout "sanitation_basic_layout"


  def init_vars
    @@pages= 11
    super
  end

  def set_percent_complete
    flash[:percent_complete]= get_percent_complete(:sanitation_basic_complete)
  end

  def country

    if request.post?
      country_code= params[:country]

      if(is_valid_country_code(country_code))
        add_to_session_form(:sanitation_basic_form, :sanitation_basic_complete, "country", country_code)

        redirect_to :action => "household"
      end
    end

    flash[:country_code] = retrieve_previous_answer_for("country")

  end

  def household
    if request.post?

      household= params[:household]

      if(is_number(household) && household.to_i > -1 && household.to_i < 12)

        add_to_session_form(:sanitation_basic_form, :sanitation_basic_complete, "household", household.to_i)

        redirect_to :action => "population"
      end
    end

     flash[:household] = retrieve_previous_answer_for("household")
  end

  def population

    if request.post?
      population= params[:population]

      if(population && is_number(population) && population.to_i > -1 && population.to_i < 150001)

        add_to_session_form(:sanitation_basic_form, :sanitation_basic_complete, "population", population.to_i)

        redirect_to :action => "latrine"
      end
    end

    flash[:population] = retrieve_previous_answer_for("population")
  end

  def latrine

    if request.post?
      latrine_index= params[:latrine]

      if(latrine_index && latrine_index.to_i > -1 && latrine_index.to_i < 6)

        add_to_session_form(:sanitation_basic_form, :sanitation_basic_complete, "latrine", latrine_index.to_i)

        redirect_to :action =>"capital"
      end
    end

    flash[:latrine] = retrieve_previous_answer_for("latrine")
  end

  def capital
    if request.post?
      capital_amount = params[:capital]


      if(capital_amount && is_number(capital_amount) && capital_amount.to_i > -1)

        add_to_session_form(:sanitation_basic_form, :sanitation_basic_complete, "capital", capital_amount.to_i)

        redirect_to :action => "recurrent"
      end
    end

    flash[:capital] = retrieve_previous_answer_for("capital")
  end

  def recurrent
    if request.post?
      recurrent_amount = params[:recurrent]


      if(recurrent_amount && is_number(recurrent_amount) && recurrent_amount.to_i > -1)

        add_to_session_form(:sanitation_basic_form, :sanitation_basic_complete, "recurrent", recurrent_amount.to_i)

        redirect_to :action => "providing"
      end
    end

    flash[:recurrent] = retrieve_previous_answer_for("recurrent")
  end

  def providing

    if request.post?
      providing_index= params[:providing]

      if(providing_index && providing_index.to_i > -1 && providing_index.to_i < 2)

        add_to_session_form(:sanitation_basic_form, :sanitation_basic_complete, "providing", providing_index.to_i)

        redirect_to :action =>"impermeability"
      end
    end

    flash[:providing] = retrieve_previous_answer_for("providing")
  end

  def impermeability
    if request.post?
      impermeability_index= params[:impermeability]

      if(impermeability_index && impermeability_index.to_i > -1 && impermeability_index.to_i < 2)

        add_to_session_form(:sanitation_basic_form, :sanitation_basic_complete,"impermeability",  impermeability_index.to_i)
        redirect_to :action =>"environment"
      end
    end

    flash[:impermeability] = retrieve_previous_answer_for("impermeability")
  end

  def environment
    if request.post?
      environment_index= params[:environment]

      if(environment_index && environment_index.to_i > -1 && environment_index.to_i < 3)

        add_to_session_form(:sanitation_basic_form, :sanitation_basic_complete, "environment",  environment_index.to_i)

        redirect_to :action =>"usage"
      end
    end

    flash[:environment] = retrieve_previous_answer_for("environment")
  end

  def usage
    if request.post?
      usage_index= params[:usage]

      if(usage_index && usage_index.to_i > -1 && usage_index.to_i < 3)

        add_to_session_form(:sanitation_basic_form,:sanitation_basic_complete, "usage",  usage_index.to_i)

        redirect_to :action =>"reliability"
      end
    end
    flash[:usage] = retrieve_previous_answer_for("usage")
  end

  def reliability
    if request.post?
      put_index_in_session(:reliability, -1, 3, "report")
    end
    flash[:reliability] = retrieve_previous_answer_for("reliability")
  end

  def put_index_in_session(key, min, max, redirect)
    radio_index= params[key]

    if(radio_index && radio_index.to_i > min && radio_index.to_i < max)

      add_to_session_form(:sanitation_basic_form, :sanitation_basic_complete, key.to_s,  radio_index.to_i)
      #increase_pages_complete

      redirect_to :action => redirect
    end
  end

  def
    report
    results= get_sanitation_basic_report

    flash[:results] = results
    render layout: "sanitation_basic_report"
  end

  private

  def retrieve_previous_answer_for(user_step)
    begin
      session[:sanitation_basic_form].has_key?(user_step) ? session[:sanitation_basic_form][user_step] : nil
    rescue
      nil
    end
  end

end
