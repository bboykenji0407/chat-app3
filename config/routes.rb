Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "messages#index"  #仮のルーティングを設定
  resources :users, only: [:edit, :update ] #usersのビュー表示用のルーティングを設定
  resources :rooms, only: [:new, :create ]  #roomsの新規作成画を面表示されるビューのルーティング設定
end
