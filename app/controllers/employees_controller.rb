class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employee = find(params[:id])
    
  end
end
