class ChatroomsController < ApplicationController
    def show
        @chatroom = Chatroom.find(params[:id])
        @owner = User.find(@chatroom.owner_id)
        @client = User.find(@chatroom.client_id)
        @message = Message.new()
    end

    def create
        flat_owner = Flat.find(params[:flat_id])
        owner = User.find(flat_owner.user_id)
        if Chatroom.exists?(name: "chatroom-#{current_user.name}-#{owner.name}")
            chatroom = Chatroom.find_by(name:"chatroom-#{current_user.name}-#{owner.name}")
            redirect_to chatroom_path(chatroom)
            return
        elsif Chatroom.exists?(name: "chatroom-#{owner.name}-#{current_user.name}")
            chatroom = Chatroom.find_by(name:"chatroom-#{owner.name}-#{current_user.name}")
            redirect_to chatroom_path(chatroom)
            return
        else 
            @chatroom = Chatroom.new()
            @chatroom.name = "chatroom-#{current_user.name}-#{owner.name}"
            @chatroom.owner_id = owner.id
            @chatroom.client_id = current_user.id
            @chatroom.flat_id = flat_owner.id
        end
        if @chatroom.save
            redirect_to chatroom_path(@chatroom)
            return
        else
            redirect_to root_path
        end
    end
end
