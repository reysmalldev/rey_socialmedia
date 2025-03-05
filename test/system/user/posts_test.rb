require "application_system_test_case"

class User::PostsTest < ApplicationSystemTestCase
  setup do
    @user_post = user_posts(:one)
  end

  test "visiting the index" do
    visit user_posts_url
    assert_selector "h1", text: "Posts"
  end

  test "should create post" do
    visit user_posts_url
    click_on "New post"

    fill_in "Content", with: @user_post.content
    fill_in "Title", with: @user_post.title
    fill_in "User", with: @user_post.user_id
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "should update Post" do
    visit user_post_url(@user_post)
    click_on "Edit this post", match: :first

    fill_in "Content", with: @user_post.content
    fill_in "Title", with: @user_post.title
    fill_in "User", with: @user_post.user_id
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "should destroy Post" do
    visit user_post_url(@user_post)
    click_on "Destroy this post", match: :first

    assert_text "Post was successfully destroyed"
  end
end
