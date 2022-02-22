# frozen_string_literal: true
require 'test_helper'
class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new name: 'Bobby', job: 'Hexlet'
    @fixture = File.read('test/fixtures/fixture.html')
  end



  def test_formbuilder
    @html = HexletCode.form_for @user, url: "/blabla" do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end
    assert_equal(@html, @fixture)
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_that_returns_form
    assert_equal(HexletCode.form_for(@user) {}, "<form action='#' method='post'><br></form>")
    assert_equal(HexletCode.form_for(@user, url: '/posts') {}, "<form action='/posts' method='post'><br></form>")

    puts @html
  end

end
