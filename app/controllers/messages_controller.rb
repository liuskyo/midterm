class MessagesController < ApplicationController
	def index
		@messages=Message.all
		
	end

	def show
		@message=Message.find(params[:id])
		@comments=@message.comments
		@comment=Comment.new
	end

	def new
		@message=Message.new
	end

	    def create
    	@message=Message.new(message_params)
    	@message.user=current_user

    	if @message.save
		   redirect_to messages_path#tell browser http code:303
		else
			render messages_path
		end
    end

    def edit
    	@message=Message.find(params[:id])
    end


    def update
    	@message=Message.find(params[:id])
    	@message.update(message_params)
    	redirect_to message_path(@message)
    end

    def destroy
    	@message=Message.find(params[:id])
    	@message.destroy
    	redirect_to messages_path
    	
    end













private
	def message_params
		params.require(:message).permit(:topic,:content)
	end
end
