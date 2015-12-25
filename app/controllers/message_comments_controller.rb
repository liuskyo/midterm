class MessageCommentsController < ApplicationController

	def create
		@message=Message.find(params[:message_id])
		@comment=@message.comments.build(comment_params)
		@comment.user=current_user
		if @comment.save
			redirect_to message_path(@message)
		else
			render redirect_to message_path(@message)
		end
	end


	def edit
		@message=Message.find(params[:message_id])
		@comment=@message.comments.find(params[:id])
	end

	def update
		@message=Message.find(params[:message_id])
		@comment=@message.comments.find(params[:id])
		if @comment.update(comment_params)
			redirect_to message_path(@message)
		else
		   render :action=>"edit"
		end

	end	

	def destroy
		@message=Message.find(params[:message_id])
		@comment=@message.comments.find(params[:id])
		@comment.destroy
		@message.save
		redirect_to message_path(@message)
	end



private
	def comment_params
		params.require(:comment).permit(:content)
		
	end
end
