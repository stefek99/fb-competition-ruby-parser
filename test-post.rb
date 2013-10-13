require "post.rb"
require "test/unit"
 
class TestPostOpeningLine < Test::Unit::TestCase
  def test_openingLine_works
    assert_equal(1, Post.openingLine?("\"1\",\"asd\""))
    assert_equal(1234567, Post.openingLine?("\"1234567\"   ,  \"asd\""))
    assert_equal(-1, Post.openingLine?("some text"))
    assert_equal(-1, Post.openingLine?(""))
  end  

  def test_finalise_method_on_post_works
  	text = %q{"1","Test Title","body body body","test javascript php"}
  	post = Post.new(1);
  	post.finalize(text);

  	assert_equal(post.title, "Test Title", "title should be correct");
  	assert_equal(post.body, "body body body", "body should be correct");
  	assert_equal(post.tags, ["test", "javascript", "php"], "tags should be correct");
  end
end