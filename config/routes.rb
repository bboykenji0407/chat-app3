Rails.application.routes.draw do
  get 'messages/index'
  root to: "messages#index"  #仮のルーティングを設定
end
