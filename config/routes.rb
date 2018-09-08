Rails.application.routes.draw do
  resources :reservable_instances
  resources :object_owners
  resources :selected_instances
  root 'virtual_machines#index'
  resources :virtual_machines
  match '/startvm' => 'virtual_machines#start_vm', via: :get
  match '/stopvm' => 'virtual_machines#stop_vm', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
