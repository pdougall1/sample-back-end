
class UsersController < ApplicationController
  def show
    @user = AR::User.find(params[:id])
  end
end



class UsersController < ApplicationController
  def show
    @user = AR::User.find(params[:id])
    @projects = @user.projects
  end
end


class UsersController < ApplicationController
  def show
    @user = AR::User.find(params[:id])
    @projects = @user.projects
    @operations = UserOperations.query(@user)
  end
end



class UsersController < ApplicationController
  def show
    @user = AR::User.find(params[:id])
    @projects = @user.projects
    @operations = UserOperations.new(@user)
    @work_tickets = ActiveUserWorkTickts.new(@user)
  end
end
