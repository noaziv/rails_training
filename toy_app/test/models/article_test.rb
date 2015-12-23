require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should save article with ok title" do
    article = Article.new
    article.title = 'Abcdef'
    assert article.save, "Didn't save a good and cool article..."
  end

  test "should not save article without title" do
	  article = Article.new
	  assert_not article.save, "Saved the article without a title"
	end

  test "should not save article not capitalized title" do
    article = Article.new
    article.title = 'abcdef'
    assert_not article.save, "Saved the article without capitalized title"
  end

  test "should not save article not capitalized text" do
    article = Article.new
    article.title = 'Abcdef'
    article.text = "abcde"
    assert_not article.save, "Saved the article without capitalized text"
  end

  test "should not save article with less than 5 letters in title" do
    article = Article.new
    article.title = 'Abc'
    assert_not article.save, "Saved the article without 5 letter+ title"
  end
end
