class FriendshipsController < ApplicationController
   before_action :authenticate_user!
   
   def show
    @friend = Friendship.find(params[:id]).friend
    @exercises = @friend.exercises 
   end
   
   def create
      friend = User.find(params[:friend_id]) 
      params[:user_id] = current_user.id
      
      Friendship.create(friendship_params) unless current_user.follow_or_same?(friend)
   end
   
   def destroy
      @friendship = Friendship.find(params[:id])
      friend = @friendship.friend.full_name
      if @friendship.destroy
         flash[:notice] = "#{friend} unfollowed"
      else
         flash.now[:alert] = "#{friend} could not be unfollowed"
      end
      redirect_to user_exercises_path(current_user)
   end
   
   private
   def friendship_params
      params.permit(:user_id, :friend_id) 
   end
end