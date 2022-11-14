class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # add routes
  get '/bakeries' do
     # get all the bakeries from the database
     bakeries = Bakery.all
     # send them back as a JSON array
     bakeries.to_json
  end
  get "/bakeries/:id" do
    # gets a specific bakery by id
    bakery = Bakery.find(params[:id])

    # returns a json reponse of the bakery details
    bakery.to_json(include: :baked_goods)
  end

  get "/baked_goods/by_price" do
    # gets all baked goods and sorts them by price
    baked_goods = BakedGood.all.order(price: :desc)

    # Converts the array into a json representation
    baked_goods.to_json
  end
  get "/baked_goods/most_expensive" do 
    #get the most expensive baked good
    baked_goods = BakedGood.all.order(price: :desc).first
     # Converts the array into a json representation
     baked_goods.to_json
  end
end
