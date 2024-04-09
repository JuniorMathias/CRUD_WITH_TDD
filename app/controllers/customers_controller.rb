class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :show, :destroy]

  def index
    @customers = Customer.all
  end
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path, notice: 'Customer Registered Successfully'
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def destroy
    if @customer.destroy
      redirect_to customers_path, notice: 'Customer Deleted Successfully'
    else
      render :index
    end
  end

  def update
    
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id), notice: 'Customer updated Successfully'
    else
      render :edit
    end
  end

  private
  
  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:id, :name, :email, :smoker, :phone, :avatar)
  end
end
