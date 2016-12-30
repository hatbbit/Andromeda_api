Rails.application.routes.draw do
  resources 'users', :except => [:new, :edit]
  resources 'articles', :except => [:new, :edit]
end
