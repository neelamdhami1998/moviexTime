class TransactionsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:verify_payment]
	before_action :authenticate_user!, except: [:verify_payment]
	include PaytmHelper
	def new
		@transaction = Transaction.new
	end
	def index
		@transactions = Transaction.all
	end
	def create
		@transaction = current_user.transactions.new(transaction_params)
		@transaction.save
	
       paramList = Hash.new
       @paytm_keys = Rails.application.config.paytm_keys
       paramList["MID"] = @paytm_keys['MID']
       paramList["ORDER_ID"] = @transaction.id
       paramList["CUST_ID"] = current_user.id
       paramList["INDUSTRY_TYPE_ID"] = @paytm_keys['INDUSTRY_TYPE_ID']
       paramList["CHANNEL_ID"] = @paytm_keys['CHANNEL_ID']
       paramList["TXN_AMOUNT"] = @transaction.total_amount
       paramList["MSISDN"] = 7689543210,
       paramList["EMAIL"] = current_user.email
       paramList["WEBSITE"] = @paytm_keys['WEBSITE']
       paramList["CALLBACK_URL"] = @paytm_keys['callback_url']
       @paramList = paramList
       @checksum_hash = generate_checksum()
       respond_to do |format|
         format.js
         format.html
   		end
	
	end
	def verify_payment
		@transaction = Transaction.find(params[:ORDERID])
		@transaction = Transaction.update(status:"successful")
		#redirect_to theaters_path
		redirect_to dashboard_index_path

	end
	def show
		@transaction = Transaction.find(params[:id])
	end
private
	def transaction_params
		params.require(:transaction).permit(:quantity,:total_amount,:user_id,:theater_id,:movie_id,:timing_id)
	end
end


