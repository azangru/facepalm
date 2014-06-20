Facepalm::Application.routes.draw do

  root to: 'images#new'

  resources :images do
    member do
      get 'facepalm'
    end
  end

end
