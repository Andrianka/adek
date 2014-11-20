class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Faktura #{@order.id}-#{@order.created_at.strftime("%d/%m/%Y")}",
               :template => 'orders/show.pdf.haml',
               :layout => false,
               :encoding => 'utf-8',
               :header => 
                {:left => "Faktura #{@order.id}-#{@order.created_at.strftime("%d/%m/%Y")}"}
      end
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order_item = OrderItem.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order_items = @order.order_items.build
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_product
    order = Order.where(:id => params[:id]).first || Order.create!(:status => Order::New)
    order_item = OrderItem.new(params.require(:order_item).permit(:id, :product_id, :quantity))
    order_item.order_id = order.id
    order_item.save
    redirect_to edit_order_path(order)
    #authorize! :edit, :orders
  end

  def destroy_product
    @order_item = OrderItem.find(params[:order_item_id])
    order = Order.find(@order_item.order_id)
    @order_item.destroy
    redirect_to order_path(order)
    # authorize! :edit, :orders
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :status, :price, :description, :deadline_at,order_items_attributes: [:id, :quantity, :product_id, :order_id, :price])
    end
end
