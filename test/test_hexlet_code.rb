# frozen_string_literal: true

require 'test_helper'
class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  User = Struct.new(:name, :job, keyword_init: true)
  def setup
    @user = User.new name: 'Sylvester', job: 'Hexlet'
    @form = File.read('test/fixtures/form.html')
  end

  def test_that_returns_error
    assert_raises(NoMethodError) do
      HexletCode.form_for @user do |f|
        f.input :name
        f.input :hobby
      end
    end
  end

  def test_that_returns_html_form
    html = HexletCode.form_for @user, url: '/subscribes' do |f|
      f.input :name
      f.input :job, as: :text, cols: 50, rows: 50, class: 'form_field'
      f.submit 'Wow', class: 'button btn-sm'
    end
    assert_equal(html, @form)
  end

  def test_that_returns_form
    assert_equal(HexletCode::Tag.build('br'), File.read('test/fixtures/br.html'))
    assert_equal(HexletCode::Tag.build('img', src: 'path/to/image'), File.read('test/fixtures/img.html'))
  end
end
