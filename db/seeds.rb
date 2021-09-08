# Category model
category = Category.create!(title: "Programming Languages")

# correct_user
correct_user = User.create!(
  email: "test_user@gmail.com",
  password: "test1234",
  password_confirmation: "test1234"
)

# Test model
tests = []

# correct test
correct_test = Test.create!(
  title: "Ruby (correct)",
  level: 0
)

3.times do
  tests << Test.create!(
    title: Faker::ProgrammingLanguage.name,
    level: rand(0..3),
    category_id: category.id)
end

# Question model
questions = []

# correct questions
correct_question = Question.create!(body: "Who created the Ruby language?")
correct_question.answers.push(Answer.create!(body: "Donald Trump"))
correct_question.answers.push(Answer.create!(body: "Matz", correct: true))
correct_question.answers.push(Answer.create!(body: "Philipp Kirkorov"))
correct_question2 = Question.create!(body: "What do we get from this expression: \"nil.empty?\" ?")
correct_question2.answers.push(Answer.create!(body: "true"))
correct_question2.answers.push(Answer.create!(body: "false"))
correct_question2.answers.push(Answer.create!(body: "NoMethodError", correct: true))

correct_test.questions.push(correct_question)
correct_test.questions.push(correct_question2)
correct_user.tests.push(correct_test)

tests.each_with_index do |test, index|
  questions << Question.create!(
    body: "Question_#{index.next}",
    test_id: test.id
  )
end

# Answer model
questions.each do |question|
  2.times { |index| Answer.create!(body: "Answer_#{index.next}", question_id: question.id) }
end

# User model
5.times do
  password = Faker::Internet.password
  User.create!(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    tests: tests[0..rand(0..2)]
  )
end