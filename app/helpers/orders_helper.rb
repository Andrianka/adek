module OrdersHelper
	
	def vat_value(vat, price, quantity)
		return quantity==1 ? price * vat/100 : price * vat/100 * quantity
	end

	def net_worth(price, quantity)
		return price * quantity
	end
end
