Rails.application.routes.draw do
  devise_for :users

  resources :doctors do
    collection do
      get 'list_male'
      get 'list_female'
    end
  end

end
