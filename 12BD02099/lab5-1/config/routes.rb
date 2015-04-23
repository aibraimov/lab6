Intrade::Application.routes.draw do
  match '/about', to: 'home#about', via: 'get'
  match '/lab5', to: 'home#lab5',   via: 'post'
  match '/rpc',  to: 'home#rpc',    via: 'get'
  match '/sis',  to: 'home#sis',    via: 'post'
  match '/client',  to: 'home#client',    via: 'get'
end
