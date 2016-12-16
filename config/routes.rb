require_relative '../lib/route_scoper'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope RouteScoper.root do
    root 'application#dashboard'

    resources :widget_data,
              format: 'json',
              only: [:index, :show, :create, :update, :destroy]

    mount ActionCable.server => '/cable'
  end
end
