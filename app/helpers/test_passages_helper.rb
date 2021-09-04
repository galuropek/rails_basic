module TestPassagesHelper
  def valid_result?(test_passage, threshold: 100)
    test_passage.result_percentage >= threshold
  end

  def result_value(test_passage, tag_class)
    content_tag :span, test_passage.result_percentage, class: tag_class
  end
end
