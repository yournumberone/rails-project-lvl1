# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

def read_fixture(name)
  path = "test/fixtures/#{name}"
  File.read(path)
end
