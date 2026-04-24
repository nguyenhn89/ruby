Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :products
  resources :categories

  # get    "/products",          to: "products#index",   as: :products        # danh sách
  # get    "/products/new",      to: "products#new",     as: :new_product     # form tạo mới
  # post   "/products",          to: "products#create"                        # lưu mới
  # get    "/products/:id",      to: "products#show",    as: :product         # xem chi tiết
  # get    "/products/:id/edit", to: "products#edit",    as: :edit_product    # form sửa
  # patch  "/products/:id",      to: "products#update"                        # lưu sửa
  # delete "/products/:id",      to: "products#destroy"                       # xóa
end
