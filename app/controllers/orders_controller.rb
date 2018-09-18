class OrdersController < ApplicationController

  before_action :insert_session_id, only: [:index, :basket, :update_basket]
  before_action :get_order, only: [:index, :basket]

  
  def index
    # get the browser cookies
    @baskets_subtotal = @baskets.present? ? @baskets.sum(&:sub_total_price) : 0
    @products = Product.all
  end
  
  def basket        
    Basket.build_order(params)
    @baskets_subtotal = @baskets.present? ? @baskets.sum(&:sub_total_price) : 0
    respond_to do |format|
      format.js 
    end
  end
    
  def update_basket
    @basket = Basket.update_order(params)
    respond_to do |format|
      format.json {
        render json: {basket: @basket}
      }
    end
  end
  
  def remove_order
    @basket = Basket.find(params[:basket])
    @basket.destroy
  end
  
  def checkout
    @baskets = Basket.where(user_cookie: session[:session_id]).update_all(email: params[:email], phone: params[:phone], status: "checkout")
    session[:session_id] = nil
    redirect_to root_path
  end
  
  private
  
  def get_order
    @baskets = BasketDecorator.decorate_collection(Basket.where(user_cookie: session[:session_id],status: "order"))
  end
  
  def insert_session_id
    params[:user_uniq] = session[:session_id]
  end
end
