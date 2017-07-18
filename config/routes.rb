Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  mount_devise_token_auth_for 'Admin', at: 'admin_auth'
  as :admin do
    # Define routes for Admin within this block.
  end

  #scope module: 'api' do
    #namespace :v1 do
      #resources :users, only: [:show, :index]
    #end
  #end
end
