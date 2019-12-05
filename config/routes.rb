Rails.application.routes.draw do

  match("/", { :controller => "inputs", :action => "input", :via => "get" })

  match("/search_song", { :controller => "inputs", :action => "search", :via => "post" } )

  
  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
