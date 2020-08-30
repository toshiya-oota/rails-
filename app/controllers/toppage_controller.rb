class ToppageController < ApplicationController
  def index
    if params[:search]
      @q = Parent.ransack(params[:search])
      @parents = @q.result(distinct: true)
    else
      @parents = nil
    end
  end
end
