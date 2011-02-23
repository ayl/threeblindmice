Threeblindmice::Application.routes.draw do
  get '/wts/browse'
  get '/micro_rnas/browse'
  resources :micro_rna_metas
  resources :wt_metas
  resources :wts
  resources :micro_rnas

  root :to => 'micro_rna_metas#index'

end
