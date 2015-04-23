Intrade::Application.routes.draw do
  match '/rpc',  to: 'home#rpc',    via: 'get'
  match '/sis',  to: 'home#sis',    via: 'get'
end
