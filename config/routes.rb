Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clientes
  resources :fornecedores
  resources :funcionarios
  resources :item_pedidos
  resources :pedido_fornecedores
  resources :pedido_orcamentos
  resources :pedidos 
  resources :produtos
  resources :servicos
  resources :status
  resources :tipo_aparelhos

  root 'home#index'
end
