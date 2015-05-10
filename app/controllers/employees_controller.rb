class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  #respond_to :html

  def index
    @employees = Employee.all
    #respond_with(@employees)
  end

  def show
    #respond_with(@employee)
  end

  def new
    @employee = Employee.new
    #respond_with(@employee)
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    #@employee.save
    #respond_with(@employee)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render action: 'show', status: :created, location: @employee }
      else
        format.html { render action: 'new' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
    
    
  end

  def update
    @employee.update(employee_params)
    #respond_with(@employee)
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    #respond_with(@employee)
    
    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :phone, :job_type)
    end
end
