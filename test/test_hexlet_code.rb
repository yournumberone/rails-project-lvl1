# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)
  @user = User.new name: 'Bobby'

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_that_returns_form
    assert_equal(HexletCode.form_for(@user) {}, "<form action='#' method='post'>\n</form>")
    assert_equal(HexletCode.form_for(@user, url: '/posts') {}, "<form action='/posts' method='post'>\n</form>")
  end

end
