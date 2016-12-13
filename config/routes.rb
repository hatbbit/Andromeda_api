Rails.application.routes.draw do
  resources 'articles', :except => [:new, :edit]
end
