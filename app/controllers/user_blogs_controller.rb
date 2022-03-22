class UserBlogsController < ApplicationController
  before_action :authenticate_user!, expect:[:index, :show]
end
