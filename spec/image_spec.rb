require 'spec_helper'

RSpec.describe Image do
  describe "blurring should work" do
    before(:each) do
      @input = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]

      @expected = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [1, 1, 1, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0]
      ]
    end
    it "should blur a standard image" do
     image = Image.new(@input)
     expect(image.blur).to eq @expected
    end
  end

  describe "specified manhattan distance blurring should work" do
    before(:each) do
      @input = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]

      @expected = [
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [1, 1, 1, 0],
        [1, 1, 1, 1],
        [1, 1, 1, 0],
        [0, 1, 0, 0]
      ]
    end
    it "should blur a standard image" do
      image = ManhattanImage.new(@input)
      expect(image.manhattan_distance_blur(2)).to eq @expected
    end
  end

end