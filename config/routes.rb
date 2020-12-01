Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clientes
  resources :suppliers
  resources :funcionarios
  resources :item_pedidos
  resources :pedido_fornecedores
  resources :pedido_orcamentos
  resources :pedidos 
  resources :produtos
  resources :servicos
  resources :states
  resources :tipo_aparelhos

  root 'home#index'
end
