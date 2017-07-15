class CommentsController < ApplicationController

  def create

    @job = Job.find(params[:job_id])
    @job.comments << Comment.new(comment_params)
    if @job.save
      flash[:success] = "New Comment added!"
      redirect_to company_job_path(@job.company, @job)
    else
      flash[:failure] = "New Comment doesn't work"
      redirect_to company_job_path(@job.company, @job)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
