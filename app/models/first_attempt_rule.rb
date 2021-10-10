class FirstAttemptRule < Rule
  MSG = 'Вы получили бэйдж за прохождение теста с первого раза!'.freeze

  def accept!(test_passage)
    current_test = test_passage.test
    current_user = test_passage.user
    test_passages = current_test.test_passages.where(user_id: current_user.id)
    return if test_passages.count != 1 || !rule_complete?(test_passages)

    current_user.badges.push(badge)
    badge
  end

  def rule_complete?(test_passages)
    test_passages.order(:id).first.success
  end

  def notification
    MSG
  end
end
