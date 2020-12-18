class CartsController < ApplicationController
    def add_item
        # 加購物車
        product = Product.find(params[:id])
        
        current_cart.add_item(product.id)
        session[:cart1234] = current_cart.serialize
        redirect_to pricing_path, notice: '已加入購物車'
    end

    def show
    end

    def destroy
        session[:cart1234] = nil
        redirect_to pricing_path, notice:'購物車已清除' 
    end

    def checkout
        @order = Order.new
        @token =gateway.client_token.generate()
    end

    private
    def gateway
        gateway = Braintree::Gateway.new(
            :environment => :sandbox,
            :merchant_id => 'wbh37tgd4pg6qywq',
            :public_key => '898677pyzry2z4pz',
            :private_key => '107971d2157eef5113cfccce35422f0f',
          )
    end
end
