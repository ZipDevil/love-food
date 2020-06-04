class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  layout 'client_layout'

  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash.notice = "The client record was created successfully."
      redirect_to @client
    else
      flash.now.alert = @client.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @client.update(client_params)
      flash.notice = "The client record was updated successfully."
      redirect_to @client
    else
      flash.now.alert = @client.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client data was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:first_name, :last_name, :phone, :email)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to clients_path
    end

end
