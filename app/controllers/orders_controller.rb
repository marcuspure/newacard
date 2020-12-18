class OrdersController < ApplicationController
    def create
        # 建立訂單

        # 付錢
        nonce = params[:payment_method_nonce]
       

        gateway.transaction.sale(
            amount: "10",
            payment_method_nonce: nonce_from_the_client,
         )

          if result.success?
            redirect_to root_path,notice:"OK"
          else
            redirect_to root_path, notice:"error"
            
    render json: = result
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
