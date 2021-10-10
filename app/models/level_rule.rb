class LevelRule < Rule
  MSG = 'Вы получили бэйдж за прохождение всех тестов c уровнем %s!'.freeze

  def accept!(test_passage)
    current_user = test_passage.user
    success_passages = select_success_passages(current_user)
    success_tests = success_passages.map(&:test)
    return if success_tests.empty? || !rule_complete?(success_tests)

    current_user.badges.push(badge)
    success_passages.each { |passage| passage.update!(level_achievement: true) }
    badge
  end

  def rule_complete?(success_tests)
    all_tests_by_level = Test.by_level(value.to_i)
    (all_tests_by_level.uniq - success_tests.uniq).empty?
  end

  def notification
    MSG % value
  end

  private

  def select_success_passages(current_user)
    current_user
      .test_passages
      .joins('JOIN tests ON tests.id = test_passages.test_id')
      .where('tests.level = ? and test_passages.success = ? and test_passages.level_achievement = ?', value, true, false)
  end
end
