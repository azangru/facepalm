Facepalm::Application.routes.draw do

  resources :images do
    member do
      get 'facepalm'
    end
  end

end
