# rubocop:disable Style/Documentation

class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all.order(:id)
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new(transaction_params)
  end

  def create
    @transaction = Transaction.new(transaction_params)
    
    if @transaction.save
      if @transaction.transaction_type == "venda"
        id = Transaction.where(enabled: true).where(pokemon_name: @transaction.pokemon_name).pluck(:id)
        disable_pokemon(id[0])
      end
      redirect_to transactions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])

    if @transaction.update(transaction_params)
      redirect_to transactions_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def disable_pokemon(id)
    @transaction_up = Transaction.find(id)
    @transaction_up.update(enabled: false)
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def transaction_params
    params.require(:transaction).permit(:pokemon_name, :transaction_value, :transaction_type, :enabled)
  end

end
