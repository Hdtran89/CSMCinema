Rails.application.routes.draw do
  root "csm#index"
    get "about" => "csm#about"
    get "contact" => "csm#contact"
    get "videography" => "csm#videography"
    get "package" => "csm#package"
  resources "contacts", only:[:add, :create]
end
