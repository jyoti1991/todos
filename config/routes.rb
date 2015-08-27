Rails.application.routes.draw do
  devise_for :users do
    get 'sign_out' => 'devise/session#destroy'
  end


  resources  :todos

  root :to =>"todos#index"



end
