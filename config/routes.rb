Rails.application.routes.draw do
  root "csm#index"
    get "about" => "csm#about"
    get "videography" => "csm#videography"
    get "package" => "csm#package"
    match '/contacts', to: 'contacts#new', via: 'get'
		resources "contacts", only: [:new, :create]
#  	get 'contact', to: 'messages#new', as: 'contact'
#		post 'contact', to: 'messages#create'
end
