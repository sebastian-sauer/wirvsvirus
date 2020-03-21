Rails.application.routes.draw do
  resources :appointments
  resources :patients
  get 'line_admin/index'
  get 'line_admin/createappointment'

  post 'line_admin/sort'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
