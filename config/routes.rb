Rails.application.routes.draw do

  root 'categories#index'

  resources :snippets
  resources :categories
  devise_for :users

=begin
   Prefix Verb   URI Pattern                    Controller#Action
        new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
            user_session POST   /users/sign_in(.:format)       devise/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
           user_password POST   /users/password(.:format)      devise/passwords#create
       new_user_password GET    /users/password/new(.:format)  devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
                         PATCH  /users/password(.:format)      devise/passwords#update
                         PUT    /users/password(.:format)      devise/passwords#update
cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
       user_registration POST   /users(.:format)               devise/registrations#create
   new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
                         PATCH  /users(.:format)               devise/registrations#update
                         PUT    /users(.:format)               devise/registrations#update
                         DELETE /users(.:format)               devise/registrations#destroy 

=end

   resources :categories , only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :snippets , only: [:new, :create, :index, :show, :edit, :update, :destroy] do
           resources :comments , only: [:new, :create, :index, :show, :edit, :update, :destroy]
           resources :tags , only: [:new, :create, :index, :show, :edit, :update, :destroy]
           resources :likes , only: [:new, :create, :index, :show, :edit, :update, :destroy]
      end
   end

   get '/categories/:id' => 'categories#show'


=begin
  
                      Prefix Verb   URI Pattern                                                               Controller#Action
                         root GET    /                                                                         categories#index
                     snippets GET    /snippets(.:format)                                                       snippets#index
                              POST   /snippets(.:format)                                                       snippets#create
                  new_snippet GET    /snippets/new(.:format)                                                   snippets#new
                 edit_snippet GET    /snippets/:id/edit(.:format)                                              snippets#edit
                      snippet GET    /snippets/:id(.:format)                                                   snippets#show
                              PATCH  /snippets/:id(.:format)                                                   snippets#update
                              PUT    /snippets/:id(.:format)                                                   snippets#update
                              DELETE /snippets/:id(.:format)                                                   snippets#destroy
                   categories GET    /categories(.:format)                                                     categories#index
                              POST   /categories(.:format)                                                     categories#create
                 new_category GET    /categories/new(.:format)                                                 categories#new
                edit_category GET    /categories/:id/edit(.:format)                                            categories#edit
                     category GET    /categories/:id(.:format)                                                 categories#show
                              PATCH  /categories/:id(.:format)                                                 categories#update
                              PUT    /categories/:id(.:format)                                                 categories#update
                              DELETE /categories/:id(.:format)                                                 categories#destroy
             new_user_session GET    /users/sign_in(.:format)                                                  devise/sessions#new
                 user_session POST   /users/sign_in(.:format)                                                  devise/sessions#create
         destroy_user_session DELETE /users/sign_out(.:format)                                                 devise/sessions#destroy
                user_password POST   /users/password(.:format)                                                 devise/passwords#create
            new_user_password GET    /users/password/new(.:format)                                             devise/passwords#new
           edit_user_password GET    /users/password/edit(.:format)                                            devise/passwords#edit
                              PATCH  /users/password(.:format)                                                 devise/passwords#update
                              PUT    /users/password(.:format)                                                 devise/passwords#update
     cancel_user_registration GET    /users/cancel(.:format)                                                   devise/registrations#cancel
            user_registration POST   /users(.:format)                                                          devise/registrations#create
        new_user_registration GET    /users/sign_up(.:format)                                                  devise/registrations#new
       edit_user_registration GET    /users/edit(.:format)                                                     devise/registrations#edit
                              PATCH  /users(.:format)                                                          devise/registrations#update
                              PUT    /users(.:format)                                                          devise/registrations#update
                              DELETE /users(.:format)                                                          devise/registrations#destroy
    category_snippet_comments GET    /categories/:category_id/snippets/:snippet_id/comments(.:format)          comments#index
                              POST   /categories/:category_id/snippets/:snippet_id/comments(.:format)          comments#create
 new_category_snippet_comment GET    /categories/:category_id/snippets/:snippet_id/comments/new(.:format)      comments#new
edit_category_snippet_comment GET    /categories/:category_id/snippets/:snippet_id/comments/:id/edit(.:format) comments#edit
     category_snippet_comment GET    /categories/:category_id/snippets/:snippet_id/comments/:id(.:format)      comments#show
                              PATCH  /categories/:category_id/snippets/:snippet_id/comments/:id(.:format)      comments#update
                              PUT    /categories/:category_id/snippets/:snippet_id/comments/:id(.:format)      comments#update
                              DELETE /categories/:category_id/snippets/:snippet_id/comments/:id(.:format)      comments#destroy
        category_snippet_tags GET    /categories/:category_id/snippets/:snippet_id/tags(.:format)              tags#index
                              POST   /categories/:category_id/snippets/:snippet_id/tags(.:format)              tags#create
     new_category_snippet_tag GET    /categories/:category_id/snippets/:snippet_id/tags/new(.:format)          tags#new
    edit_category_snippet_tag GET    /categories/:category_id/snippets/:snippet_id/tags/:id/edit(.:format)     tags#edit
         category_snippet_tag GET    /categories/:category_id/snippets/:snippet_id/tags/:id(.:format)          tags#show
                              PATCH  /categories/:category_id/snippets/:snippet_id/tags/:id(.:format)          tags#update
                              PUT    /categories/:category_id/snippets/:snippet_id/tags/:id(.:format)          tags#update
                              DELETE /categories/:category_id/snippets/:snippet_id/tags/:id(.:format)          tags#destroy
       category_snippet_likes GET    /categories/:category_id/snippets/:snippet_id/likes(.:format)             likes#index
                              POST   /categories/:category_id/snippets/:snippet_id/likes(.:format)             likes#create
    new_category_snippet_like GET    /categories/:category_id/snippets/:snippet_id/likes/new(.:format)         likes#new
   edit_category_snippet_like GET    /categories/:category_id/snippets/:snippet_id/likes/:id/edit(.:format)    likes#edit
        category_snippet_like GET    /categories/:category_id/snippets/:snippet_id/likes/:id(.:format)         likes#show
                              PATCH  /categories/:category_id/snippets/:snippet_id/likes/:id(.:format)         likes#update
                              PUT    /categories/:category_id/snippets/:snippet_id/likes/:id(.:format)         likes#update
                              DELETE /categories/:category_id/snippets/:snippet_id/likes/:id(.:format)         likes#destroy
            category_snippets GET    /categories/:category_id/snippets(.:format)                               snippets#index
                              POST   /categories/:category_id/snippets(.:format)                               snippets#create
         new_category_snippet GET    /categories/:category_id/snippets/new(.:format)                           snippets#new
        edit_category_snippet GET    /categories/:category_id/snippets/:id/edit(.:format)                      snippets#edit
             category_snippet GET    /categories/:category_id/snippets/:id(.:format)                           snippets#show
                              PATCH  /categories/:category_id/snippets/:id(.:format)                           snippets#update
                              PUT    /categories/:category_id/snippets/:id(.:format)                           snippets#update
                              DELETE /categories/:category_id/snippets/:id(.:format)                           snippets#destroy
                              GET    /categories(.:format)                                                     categories#index
                              POST   /categories(.:format)                                                     categories#create
                              GET    /categories/new(.:format)                                                 categories#new
                              GET    /categories/:id/edit(.:format)                                            categories#edit
                              GET    /categories/:id(.:format)                                                 categories#show
                              PATCH  /categories/:id(.:format)                                                 categories#update
                              PUT    /categories/:id(.:format)                                                 categories#update
                              DELETE /categories/:id(.:format)                                                 categories#destroy

=end
 

end
