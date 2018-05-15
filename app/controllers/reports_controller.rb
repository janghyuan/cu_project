class ReportsController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :correct_user, only: [:index]
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
    @reports = @user.reports
  end
  
  def collect
    @reports = Report.all.group_by { |report|
        report.created_at.strftime("%U")
    }.flat_map { |week, reports|
        reports.sort_by(&:created_at).reverse
    }
  end
  
  private
  def report_params
    params.require(:report).permit(:content) 
  end
end
