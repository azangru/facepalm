Facepalm::Application.routes.draw do

  resources :images do
    member do
      get 'facepalm'
      get 'facepalmed'
    end
  end

end
