Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :contratacao
      resources :sumario
      resources :lider
      resources :fundador
      resources :empsr
      resources :empjr
      resources :coordenador
      resources :company
    end
  end

  # constraints subdomain: 'api' do
  #   scope module: 'api' do
  #     namespace :v1 do
  #       resources :contacts
  #     end
  #   end
  # end
end