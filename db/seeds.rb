# Category model
category = Category.create!(title: "Programming Languages")

Badge.create!(
  title: "Category",
  image_url: "https://i.ibb.co/YZSmmfD/2426188-200.png",
  rule_type: "category",
  value: "Programming Languages"
)

Badge.create!(
  title: "Level",
  image_url: "https://i.ibb.co/2W0gXWX/kerbau-163205451.jpg",
  rule_type: "level",
  value: "1"
)

Badge.create!(
  title: "First attempt",
  image_url: "https://i.ibb.co/mcGcTBX/47993.png",
  rule_type: "first_attempt",
  value: ""
)

# correct_user
correct_user = Admin.create!(
  email: "test1234@gmail.com",
  first_name: 'Harry',
  last_name: 'Potter',
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
