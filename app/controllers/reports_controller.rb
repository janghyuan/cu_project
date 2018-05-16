class ReportsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :new, :create]
  before_action :correct_user, only: [:index, :new, :create, :show, :edit, :update]
  before_action :admin_user_redi, only: [:collect]
  def new
    @user = User.find_by(id: params[:user_id])
    @report = @user.reports.build
  end
  
  def create
    @user = User.find_by(id: params[:user_id])
    @report = @user.reports.build(report_params)
    if @report.save
      flash[:success] = "You have successfully created a report!"
      redirect_to user_reports_url(@user)
    else
      flash.now[:danger] = 'Something wrong with your content!'
      render 'new' 
    end
  end
  
  def index
    @user = User.find_by(id: params[:user_id])
    @reports = @user.reports.paginate(page: params[:page], per_page: 10)
  end
  
  def collect
    # @reports = Report.all.group_by { |report|
    #     report.created_at.strftime("%U")
    # }.flat_map { |week, reports|
    #     reports.sort_by(&:created_at).reverse
    # }.paginate(page: params[:page], per_page: User.count)
    @reports = Report.order(created_at: :desc).paginate(page: params[:page], per_page: User.count)
  end
  
  def show
    @user = User.find_by(id: params[:user_id])
    @report = @user.reports.find_by(id: params[:id])
  end
  def edit
    @user = User.find_by(id: params[:user_id])
    @report = @user.reports.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:user_id])
    @report = @user.reports.find_by(id: params[:id])
    if @report.update_attributes(report_params)
      flash[:success] = "更新成功！" 
      redirect_to user_report_url(@user, @report)
    else
      render 'edit'
    end
  end
  private
  def report_params
    params.require(:report).permit(:content) 
  end
end
