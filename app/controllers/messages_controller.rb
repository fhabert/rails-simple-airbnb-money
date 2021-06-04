class MessagesController < ApplicationController
    def create
        @message = Message.new(set_message)
        @chatroom = Chatroom.find(params[:chatroom_id])
        @message.user = current_user
        @message.chatroom = @chatroom
        if @message.save
            ChatroomChannel.broadcast_to(
                @chatroom,
                render_to_string(partial: "message", locals: { message: @message } )
            )
            redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
        else
            redirect_to flat_path(@chatroom.flat_id)
        end
    end

    private

    def set_message
        params.require(:message).permit(:content)
    end
end
