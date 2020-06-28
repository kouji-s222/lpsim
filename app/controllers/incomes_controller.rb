class IncomesController < ApplicationController

  def index
    @incomes = Income.order(created_at: :asc)
	end
 
	def new
		@income = Income.create(params[:income])
	end
 
	def create
		@income = Income.new(params[:id])
		if @income.save
			redirect_to @incomes, notice: "収入科目を登録しました"
		else
			render "incomes/index"
		end
	end
 
	def update
		@income = Income.find(params[:id])
		@income.assign_attributes(params[:id])
		if @income.save
			redirect_to balance_confirm_path
		else
			render template: "balance_confirm/top"
		end
	end
 
	def destroy
	end

end