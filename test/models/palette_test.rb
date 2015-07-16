require 'test_helper'

class PaletteTest < ActiveSupport::TestCase
  
  def setup
    @palette = palettes(:one)
  end

  test "fixture is valid" do
    assert @palette.valid? 
  end

  test "invalid without dom_one" do
    @palette.dom_one = nil
    refute @palette.valid? 
    assert @palette.errors.keys.include?(:dom_one)
  end 

  test "invalid without dom_two" do
    @palette.dom_two = nil
    refute @palette.valid? 
    assert @palette.errors.keys.include?(:dom_two)
  end

  test "invalid without sec_one" do
    @palette.sec_one = nil
    refute @palette.valid? 
    assert @palette.errors.keys.include?(:sec_one)
  end

  test "invalid without sec_two" do
    @palette.sec_two = nil
    refute @palette.valid? 
    assert @palette.errors.keys.include?(:sec_two)
  end

  test "invalid without pop" do
    @palette.pop = nil
    refute @palette.valid? 
    assert @palette.errors.keys.include?(:pop)
  end

  test "invalid without name" do
    @palette.name = nil
    refute @palette.valid? 
    assert @palette.errors.keys.include?(:name)
  end

end
