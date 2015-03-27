Rails.application.routes.draw do

  resources :apps do
    resources :builds
  end
  resources :builds

  devise_for :users, :path => '/',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'password',
      confirmation: 'verification',
      unlock: 'unblock',
      registration: 'signup',
      sign_up: 'new'
    }
  devise_scope :users do
    get '/logout' => 'devise/sessions#destroy'
  end

  root to: "apps#index"

  get "/:digest/download", to: "builds#download", as: "download"
  get "/:digest/plist", to: "builds#plist", as: "plist"

end
