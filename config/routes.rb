Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  #As question ask to hit localhosst:3000 url, i.e. root path to get the expected response
  root to: 'solutions#solution'

  #if user client don't want the data on root path, instead if it required to have specific API endpoint then one can use following route
  #get '/solution' => 'solutions#solution', :as => 'solution' #(localhost:3000/solution)

end
