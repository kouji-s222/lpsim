class IncomesController < ApplicationController

	def index
		@income = Income.new
    # @incomes = Income.order(created_at: :asc)
	end
 
	def new
		@income = Income.new
	end
 
	def create
		@income = Income.new(income_params)
		if @income.save
			redirect_to income_path(@income.id), notice: "登録しました"
		else
			render :index
		end
	end
 
	def show
		@income = Income.find_by(user_id: current_user.id)
	end
 
	private
  def income_params
    params.require(:income).permit(:total_income, :saving, :housing, :transportation, :event).merge(user_id: current_user.id)
	end
	
end