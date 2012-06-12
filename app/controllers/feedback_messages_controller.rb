class FeedbackMessagesController < ApplicationController
  # GET /feedback_messages
  # GET /feedback_messages.json
  def index
    @feedback_messages = FeedbackMessage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedback_messages }
    end
  end

  # GET /feedback_messages/1
  # GET /feedback_messages/1.json
  def show
    @feedback_message = FeedbackMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feedback_message }
    end
  end

  # GET /feedback_messages/new
  # GET /feedback_messages/new.json
  def new
    @feedback_message = FeedbackMessage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feedback_message }
    end
  end

  # GET /feedback_messages/1/edit
  def edit
    @feedback_message = FeedbackMessage.find(params[:id])
  end

  # POST /feedback_messages
  # POST /feedback_messages.json
  def create
    @feedback_message = FeedbackMessage.new(params[:feedback_message])

    respond_to do |format|
      if @feedback_message.save
        #TODO email versturen
        AdminMailer.helpdesk_notification(@feedback_message).deliver
        format.html { redirect_to @feedback_message, notice: 'Feedback message was successfully created.' }
        format.json { render json: @feedback_message, status: :created, location: @feedback_message }
      else
        format.html { render action: "new" }
        format.json { render json: @feedback_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feedback_messages/1
  # PUT /feedback_messages/1.json
  def update
    @feedback_message = FeedbackMessage.find(params[:id])

    respond_to do |format|
      if @feedback_message.update_attributes(params[:feedback_message])
        format.html { redirect_to @feedback_message, notice: 'Feedback message was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @feedback_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_messages/1
  # DELETE /feedback_messages/1.json
  def destroy
    @feedback_message = FeedbackMessage.find(params[:id])
    @feedback_message.destroy

    respond_to do |format|
      format.html { redirect_to feedback_messages_url }
      format.json { head :ok }
    end
  end
end
