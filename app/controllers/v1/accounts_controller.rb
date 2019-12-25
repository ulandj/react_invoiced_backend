module V1
  class AccountsController < ApplicationController
    def create
      @account = current_user.accounts.build(account_params)

      if @account.save
        render :create, status: created
      else
        head(:unprocessable_entity)
      end
    end

    def update
      @account = current_user.accounts.friendly.find(params[:id])

      if @acccount.update(account_params)
        render :update
      else
        head(:unprocessable_entity)
      end
    end

    private

    def account_params
      params.require(:account).permit(:name, :address, :vat_rate, :tax_payer_id, :default_currency)
    end
  end
end