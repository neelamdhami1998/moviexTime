module PaytmHelper
    include Paytm::EncryptionNewPG
	 def generate_checksum
	    new_pg_checksum(@paramList, @paytm_keys['PAYTM_MERCHANT_KEY']).gsub("\n",'')
	end

	def verify_checksum
	    new_pg_verify_checksum(@paytmparams, @checksum_hash, @paytm_keys['PAYTM_MERCHANT_KEY'])
	end
end