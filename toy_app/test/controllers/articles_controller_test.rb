require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup :initialize_article

  def teardown
    @article = nil
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
    assert_template :index
    assert_template layout: "layouts/application"
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, article: { text: @article.text, title: @article.title }
    end

    assert_redirected_to article_path(assigns(:article))
    assert_equal 'Article was successfully created.', flash[:notice]
    # byebug
  end

  test "should route to create article" do
    assert_routing({ method: 'post', path: '/articles' }, { controller: "articles", action: "create" })
  end

  test "should show article" do
    get :show, id: @article
    assert_response :success
  end

  test "should route to article" do
    assert_routing '/articles/1', { controller: "articles", action: "show", id: "1" }
  end

  test "should get edit" do
    get :edit, id: @article
    assert_response :success
  end

  test "should update article" do
    patch :update, id: @article, article: { text: @article.text, title: @article.title }
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article
    end

    assert_redirected_to articles_path
  end

  private

    def initialize_article
      @article = articles(:article_0)
    end
end
