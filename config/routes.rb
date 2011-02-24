Threeblindmice::Application.routes.draw do
  get '/wts/browse'
  get '/micro_rnas/browse'
  get '/wts/search'
  get '/micro_rnas/search'
  get '/wts/genesearch'
  get '/micro_rnas/genesearch'
  resources :micro_rna_metas
  resources :wt_metas
  resources :wts
  resources :micro_rnas

  root :to => 'micro_rna_metas#index'

end
