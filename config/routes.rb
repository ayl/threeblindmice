Threeblindmice::Application.routes.draw do
  resources :micro_rna_metas
  resources :wt_metas

  root :to => 'micro_rna_metas#index'

end
