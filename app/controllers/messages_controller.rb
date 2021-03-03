class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user) #チャットルームに紐づいている(@room.message)を@messagesと定義。
  end

  def create          #messagesコントローラーにcreateアクションを定義します。
    @room = Room.find(params[:room_id])   #@room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成し、message_paramsを引数にして、privateメソッドを呼び出します。
    @message = @room.messages.new(message_params)   #生成したインスタンスを@messageに代入し、saveメソッドでメッセージの内容をmessagesテーブルに保存します。
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end      #createアクション内に、メッセージを保存できた場合とできなかった場合で条件分岐の処理を行います。
  end
  private
  
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end


#パラメーターの中に、ログインしているユーザーのidと紐付いている、メッセージの内容contentを受け取れるように許可します。
#privateメソッドとしてmessage_paramsを定義し、メッセージの内容contentをmessagesテーブルへ保存できるようにします。