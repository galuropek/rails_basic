class TestsController < ApplicationController
  def index
    render plain: Test.all.map { |test| "#{test.title} (level: #{test.level})" }.join("\n")
  end

  def show
    test = Test.find(params[:id])
    render html: "<h2>#{test.title} (level: #{test.level})<h2>".html_safe
  end
end
