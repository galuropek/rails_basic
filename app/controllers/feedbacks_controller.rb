class FeedbacksController < ApplicationController
  def index; end

  def create
    feedback = params.dig(:feedback, :body)

    if feedback.present?
      MessageMailer.send_feedback(current_user.email, feedback).deliver_now
      flash[:success] = 'Отзыв отправлен!'

      redirect_to root_path
    else
      flash.now[:danger] = 'Отзыв не может быть пустым!'

      render :index
    end
  end
end
