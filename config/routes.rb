WashCostApp::Application.routes.draw do

  match '/infographic' => 'infographic#index'
  match '/infographic/mobile' => 'mobile#infographic'

  scope '/:locale', locale: /en|fr/ do

    devise_for :users, :controllers => { :sessions => 'authentication/sessions', :registrations => 'authentication/registrations', :passwords => 'authentication/passwords' }

    resources :dashboard

    resources :subscribers

    scope '/calculators' do

      post '/selection' => 'calculators#selection'

      namespace :basic do

        scope '/report' do
          get  '/questionnaire', :to => 'reports#questionnaire', :as => 'report_questionnaire'
          post '/save', :to => 'reports#save', :as => 'report_save'
          post '/load', :to => 'reports#load', :as => 'report_load'
        end

        scope '/water' do
          get   '/report', :to => 'water#report', :as => 'water_report'
          match '/:action' => 'water#(:action)', :via => [ :get, :post ], :as => 'water_action'
          root :to => redirect( '/%{locale}/calculators/basic/water/country' ), :as => 'water'
        end

        scope '/sanitation' do
          get   '/report', :to => 'sanitation#report', :as => 'sanitation_report'
          match '/:action' => 'sanitation#(:action)', :via => [ :get, :post ], :as => 'sanitation_action'
          root :to => redirect( '/%{locale}/calculators/basic/sanitation/country' ), :as => 'sanitation'
        end

      end

      namespace :advanced do

        scope '/water' do
          get '/begin' => 'water#begin', :as => 'water_begin'
          get '/report' => 'water#report', :as => 'water_report'
          get  '/:section' => 'water#questionnaire', :as => 'water_action'
          post '/update/:section' => 'water#update', :as => 'water_update'
          post '/dynamic_update' => 'water#dynamic_update', :as => 'water_dynamic_update'
          root :to => redirect( '/%{locale}/calculators/advanced/water/context' ), :as => 'water'
        end

      end

      root :to => 'calculators#index', :as => 'calculators'

    end

    match '/dashboard' => 'dashboard#index', :as => 'dashboard'

    root :to => 'landing#index', :as => 'localised_root'

  end

  root :to => redirect( "/#{I18n.default_locale}/" )

end
