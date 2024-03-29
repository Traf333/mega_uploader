class AttachmentsController < ApplicationController

  before_action :get_user

  before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  # GET /attachments
  # GET /attachments.json
  def index
    @attachments = @user.attachments
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
  end

  # GET /attachments/new
  def new
    @attachment = @user.attachments.build
  end

  # GET /attachments/1/edit
  def edit
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = @user.attachments.create(attachment_params)
  end

  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to @user, notice: 'Attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @attachment }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to @user, notice: 'Attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end

  def set_attachment
    @attachment = @user.attachments.find(params[:id])
  end

  def attachment_params
    params.require(:attachment).permit(:title, :item, :tag_list)
  end
end
