Rails.application.routes.draw do
  get 'line_admin/index'
  get 'questionnaire/questions'
  root 'questionnaire#intro' 

  post 'line_admin/sort'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
