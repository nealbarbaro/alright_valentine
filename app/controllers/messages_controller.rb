class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index

    @sent_messages = Message.where(:sender_id => current_user.id)
    @received_messages = Message.where(:receiver_id => current_user.id)


    # @message << @received_messages

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show

    # @conversation_partner = Message.find(params[:receiver])

    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  def converse

    @message = Message.new

    @conversation_partner = User.find(params[:id])

    @sent_messages = Message.where("sender_id = ? AND receiver_id = ?", current_user.id, @conversation_partner)
    @received_messages ||= Message.where("sender_id = ? AND receiver_id = ?", @conversation_partner, current_user.id)

    @all_messages = @sent_messages + @received_messages
    @all_messages = @all_messages.sort_by {|a| a.created_at}
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @message }
    # end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new
    @users = User.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    # sender = User.find(params[:message][:sender])
    # receiver = User.find(params[:message][:receiver])
    # content = params[:message][:content]
    # @message = Message.new(content: content, sender: sender, receiver: receiver)
    # @message = Message.new(params[:message])
    # @user = User.find(session[:user_id])
    #@message = current_user.sent_messages.create(params[:message])
    # @user = User.find(session[:user_id])
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save

        @conversation_partner = User.find(params[:message][:receiver_id])

        @sent_messages ||= Message.where("sender_id = ? AND receiver_id = ?", current_user.id, @conversation_partner)
        @received_messages ||= Message.where("sender_id = ? AND receiver_id = ?", @conversation_partner, current_user.id)

        @all_messages = @sent_messages + @received_messages
        @all_messages = @all_messages.sort_by {|a| a.created_at}

        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
