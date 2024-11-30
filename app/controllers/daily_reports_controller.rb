class DailyReportsController < ApplicationController
  def show
    @tasks = Task.default_order
  end
end
