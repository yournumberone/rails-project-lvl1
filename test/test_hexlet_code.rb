# frozen_string_literal: true
require 'test_helper'
class TestHexletCode < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  User = Struct.new(:name, :job, keyword_init: true)
  def setup
    @user = User.new name: 'Sylvester', job: 'Hexlet'
    @fixture = File.read('test/fixtures/fixture.html')
  end

  def test_that_returns_error
    assert_raises(NoMethodError) { HexletCode.form_for @user do |f|
      f.input :name
      f.input :hobby
    end }
  end

  def test_that_returns_html_form
    html = HexletCode.form_for @user, url: '/subscribes' do |f|
      f.input :name
      f.input :job, as: :text, class: 'form_field'
      f.submit 'Wow', class: "button"
    end
    assert_equal(html, @fixture)
  end

  def test_that_returns_form
    assert_equal(HexletCode.form_for(@user) {}, "<form action='#' method='post'><br></form><br>")
    assert_equal(HexletCode.form_for(@user, url: '/posts') {}, "<form action='/posts' method='post'><br></form><br>")
    puts @html
  end

end
