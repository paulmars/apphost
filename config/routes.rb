class CentralDomain
  def self.matches?(request)
    ["apphoster.dev", "apphoster.herokuapp.com", "apphost.link"].include?(request.host)
  end
end

class SiteDomain
  def self.matches?(request)
    !["apphoster.dev", "apphoster.herokuapp.com"].include?(request.host)
  end
end

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

  get "/:digest/download", to: "builds#download", as: "download"
  get "/:id/latest", to: "builds#latest", as: "latest"
  get "/:digest/plist", to: "builds#plist", as: "plist"

  constraints SiteDomain do
    root to: 'builds#latest', as: "site_root"
  end

  constraints CentralDomain do
    root to: "apps#index"
  end

end
