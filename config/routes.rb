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

  resources :pedido_orcamentos do
    resources :item_orcamentos
  end

  resources :pedido_suppliers do
    resources :item_pedidos
  end

  root 'home#index'

  get 'estoque', controller: 'estoque', action: 'estoque', as: 'estoque'
  get 'estoque/saidas', controller: 'estoque', action: 'saida_estoque', as: 'saida_estoque'
  get 'estoque/entradas', controller: 'estoque', action: 'entrada_estoque', as: 'entrada_estoque'

  get 'servico/:id/assumir', controller: 'servicos', action: 'assumir', as: 'assumir_servico'
  post 'servico/:id/assumir', controller: 'servicos', action: 'assumir_responsabilidade', as: 'assumir_responsabilidade_post'
  put 'servico/:id/assumir', controller: 'servicos', action: 'assumir_responsabilidade', as: 'assumir_responsabilidade_put'
  patch 'servico/:id/assumir', controller: 'servicos', action: 'assumir_responsabilidade', as: 'assumir_responsabilidade_patch'
end
