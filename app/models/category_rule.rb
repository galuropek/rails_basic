class CategoryRule < Rule
  MSG = 'Вы получили бэйдж за прохождение всех тестов в категории "%s"!'.freeze

  def accept!(test_passage)
    current_user = test_passage.user
    success_passages = select_success_passages(current_user)
    success_tests = success_passages.map(&:test)
    return if success_tests.empty? || !rule_complete?(success_tests)

    current_user.badges.push(badge)
    success_passages.each { |passage| passage.update!(category_achievement: true) }
    badge
  end

  def rule_complete?(success_tests)
    all_tests_from_category = Test.tests_by_category_name(value)
    (all_tests_from_category.uniq - success_tests.uniq).empty?
  end

  def notification
    MSG % value
  end

  private

  def select_success_passages(current_user)
    current_user
      .test_passages
      .joins('JOIN tests ON tests.id = test_passages.test_id')
      .joins('JOIN categories ON categories.id = tests.category_id')
      .where('categories.title = ? and test_passages.success = ? and test_passages.category_achievement = ?', value, true, false)
  end
end
