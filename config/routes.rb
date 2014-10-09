Rails.application.routes.draw do

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

  root to: "builds#index"

  get "/", to: "builds#index"
  
  get "/new", to: "builds#new", as: "new_build"
  post "/new", to: "builds#create"

  get "/:digest/plist", to: "builds#plist", as: "plist"

end
