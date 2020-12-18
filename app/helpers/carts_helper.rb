module CartsHelper
    def current_cart
      @_cart1234 ||= Cart.from_hash(session[:cart1234])
    end
end
