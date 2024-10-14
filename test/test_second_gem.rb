# frozen_string_literal: true

require "test_helper"
require "minitest/autorun"
require 'second_gem'

class TestSecondGem < Minitest::Test
  def setup
    @crud = SecondGem::Base.new
  end

  def test_list
    @crud.create(name: "Alice")
    @crud.create(name: "nay")
    assert_equal 2, @crud.list.size
  end

  def test_create
    @crud.create(name: "Alice")
    assert_equal 1, @crud.list.size
  end

  def test_read
    @crud.create(name: "Nay Lin Aung")
    assert_equal({ name: "Nay Lin Aung"}, @crud.read(1))
  end

  def test_update
    @crud.create(name: "Charlie")
    @crud.update(1, age: 25)
    assert_equal({ name: "Charlie", age: 25 }, @crud.read(1))
  end

  def test_delete
    @crud.create(name: "David")
    @crud.delete(1)
    assert_nil @crud.read(1)
  end
end
