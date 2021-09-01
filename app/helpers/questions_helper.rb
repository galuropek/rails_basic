module QuestionsHelper
  def question_header
    case action_name
    when "new"
      "Create New #{@test.title} Question"
    when "edit"
      "Edit #{@question.test.title} Question"
    else
      "Question"
    end
  end
end
