Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  resources :blogs do
    resources :articles, shallow: true do
      member do
        get :public
      end
    end
    resources :user_blogs, only:[:index, :new, :create]
  end
    resources :user_blogs, only:[:show, :edit, :update, :destroy]
end
