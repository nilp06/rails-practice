class HomeController < ApplicationController
<<<<<<< HEAD
  def index
  end
=======
  skip_before_action :authenticate_user, only: [:index]
  def index; end
>>>>>>> ea83a67 (feat:TE7-T120 active-record-query-interface:add authentication functionality)
end
