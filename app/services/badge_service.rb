class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @current_test = @test_passage.test
    @current_user = @test_passage.user
    @success_tests = @current_user.tests.where("test_passages.success = true")
    @badges = Badge.all
  end

  def call
    @badges.map do |badge|
      if send("#{badge.rule_type}_rule_completed?", badge)
        @current_user.badges.push(badge)
        { image_url: badge.image_url, notification: badge.notification }
      end
    end.compact
  end

  private

  def category_rule_completed?(badge)
    badge.notification = "Вы получили ачивку за прохождение всех тестов из категории %s" % badge.value
    success_tests_from_category = @success_tests.by_category_name(badge.value).distinct.count
    all_tests_from_category = Test.by_category_name(badge.value).count
    all_tests_from_category == success_tests_from_category && !@current_user.badges.include?(badge)
  end

  def level_rule_completed?(badge)
    badge.notification = "Вы получили ачивку за прохождение всех тестов c уровнем %s" % badge.value
    success_tests_by_level = @success_tests.by_level(badge.value).distinct.count
    all_tests_by_level = Test.by_level(badge.value).count
    all_tests_by_level == success_tests_by_level && !!@current_user.badges.include?(badge)
  end

  def first_attempt_rule_completed?(badge)
    badge.notification = "Вы получили ачивку за прохождение теста с первого раза"
    test_passages = @current_test.test_passages.where(user_id: @current_user.id)
    return false unless test_passages.count == 1

    test_passages.first.success
  end
end