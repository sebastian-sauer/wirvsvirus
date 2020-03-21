Rails.application.routes.draw do
  
  get 'line_admin/index'
  get 'questionnaire/questions'
  root 'questionnaire#intro' 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
