module TestPassagesHelper
  def valid_result?(test_passage, threshold: 100)
    test_passage.result_percentage >= threshold
  end

  def result_value(test_passage, tag_class)
    content_tag :span, test_passage.result_percentage, class: tag_class
  end

  def question_number(test_passage)
    test_passage.test.questions.order(:id).index(test_passage.current_question).next
  end
end
