class CategoryRule < Rule
  MSG = 'Вы получили ачивку за прохождение теста!'.freeze

  def accept!(current_user)
    success_passages = current_user.test_passages
      .joins('JOIN tests ON tests.id = test_passages.test_id')
      .joins('JOIN categories ON categories.id = tests.category_id')
      .where('categories.title = ? and test_passages.success = ? and test_passages.has_achievement = ?', value, true, false)

    success_tests = success_passages.map(&:test)
    return unless rule_complete?(success_tests)

    current_user.badges.push(badge)
    success_passages.each { |test_passage| test_passage.update!(has_achievement: true) }
    badge
  end

  def rule_complete?(success_tests)
    all_tests_from_category = Test.tests_by_category_name(value)
    (all_tests_from_category.uniq - success_tests.uniq).empty?
  end

  def notification
    MSG
  end
end
