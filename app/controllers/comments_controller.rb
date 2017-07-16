class CommentsController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    @job.comments << Comment.new(comment_params)
    if @job.save
      flash[:success] = "New Comment added!"
      redirect_to company_job_path(@job.company, @job)
    else
      flash[:failure] = "No content to add to Comments"
      redirect_to company_job_path(@job.company, @job)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @job = Job.find(params[:job_id])
    @comment.destroy
    redirect_to company_job_path(@job.company, @job)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def show
    @job = Job.find(params[:job_id])
    @comment = Comment.find(comment_params)
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
