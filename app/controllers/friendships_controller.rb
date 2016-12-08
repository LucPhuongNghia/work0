class FriendshipsController < ApplicationController
   before_action :authenticate_user!
   
   def create
      friend = User.find(params[:friend_id]) 
      params[:user_id] = current_user.id
      
      Friendship.create(friendship_params) unless current_user.follow_or_same?(friend)
   end
   
   private
   def friendship_params
      params.permit(:user_id, :friend_id) 
   end
end