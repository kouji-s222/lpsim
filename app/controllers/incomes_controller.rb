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
		@income = Income.find(params[:id])
		# 月利(年利15%)
		# 月単位の支払いなので、月利で計算します。loanrate
		interest_rate = @income.loanrate / 100 / 12
		# 支払い回数(5年)loanYear
		number_of_payments = @income.loanYear * 12
		# 借入金額
		borrowing_amount = @income.housing
	  @payment = Exonio.pmt(interest_rate, number_of_payments, borrowing_amount) * 12

		@graph = [
			{name: '収入', data: {"#{@income.myAge}歳" => @income.total_income, "#{@income.myAge + 5}歳" => @income.total_income, "#{@income.myAge + 10}歳" => @income.total_income, "#{@income.myAge + 15}歳" => @income.total_income, "#{@income.myAge + 20}歳" => @income.total_income, "#{@income.myAge + 25}歳" => @income.total_income, "#{@income.myAge + 30}歳" => @income.total_income, "#{@income.myAge + 35}歳" => @income.total_income, "#{@income.myAge + 40}歳" => @income.total_income, "#{@income.myAge + 45}歳" => @income.total_income}},
			{name: '出費', data: {"#{@income.myAge}歳" => @payment, "#{@income.myAge + 5}歳" => @payment, "#{@income.myAge + 10}歳" => @payment, "#{@income.myAge + 15}歳" => @payment, "#{@income.myAge + 20}歳" => @payment, "#{@income.myAge + 25}歳" => @payment, "#{@income.myAge + 30}歳" => @payment, "#{@income.myAge + 35}歳" => @payment, "#{@income.myAge + 40}歳" => @payment, "#{@income.myAge + 45}歳" => @payment}},
		];
		@balance = [{name: '貯蓄', data: {"#{@income.myAge}歳" => @income.total_income - @payment, "#{@income.myAge + 5}歳" => @income.total_income * 5 - @payment * 5, "#{@income.myAge + 10}歳" => @income.total_income * 10 - @payment * 10, "#{@income.myAge + 15}歳" => @income.total_income * 15 - @payment * 15, "#{@income.myAge + 20}歳" => @income.total_income * 20 - @payment * 20, "#{@income.myAge + 25}歳" => @income.total_income * 25 - @payment * 25, "#{@income.myAge + 30}歳" => @income.total_income * 30 - @payment * 30, "#{@income.myAge + 35}歳" => @income.total_income, "#{@income.myAge + 40}歳" => @income.total_income, "#{@income.myAge + 45}歳" => @income.total_income}},]
	end
 
	private
  def income_params
    params.require(:income).permit(:myAge, :total_income, :saving, :housing, :loanrate, :loanYear, :transportation, :event).merge(user_id: current_user.id)
	end

end