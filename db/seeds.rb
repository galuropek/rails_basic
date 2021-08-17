# Category model
category = Category.create!(title: "Programming Languages")

# Test model
tests = []
3.times do
  tests << Test.create!(
      title: Faker::ProgrammingLanguage.name,
      level: rand(0..3),
      category_id: category.id )
end

# Question model
questions = []
tests.each_with_index do |test, index|
  questions << Question.create!(
      body: "Question_#{index.next}",
      test_id: test.id )
end

# Answer model
questions.each do |question|
  2.times { |index| Answer.create!(body: "Answer_#{index.next}", question_id: question.id) }
end

# User model
5.times { User.create!(email: Faker::Internet.email, password: Faker::Internet.password) }