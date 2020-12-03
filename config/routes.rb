Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clientes
  resources :suppliers
  resources :funcionarios
  resources :pedidos 
  resources :produtos
  resources :servicos
  resources :states
  resources :tipo_aparelhos

  resources :pedido_orcamentos

  resources :pedido_suppliers do
    resources :item_pedidos
  end

  root 'home#index'
end
