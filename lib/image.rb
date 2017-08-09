class Image
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def blur
    blurred_image = []
    indices = []
    @data.each_with_index do |row, index|
      previous_one = false
      row.each_with_index do |pixel, inner_index|
        if pixel == 0
          if !previous_one
            blurred_image << pixel
          end
          previous_one = false
        else
          if inner_index > 0
            blurred_image[blurred_image.length-1] = 1
          end
          if inner_index == row.length-1
            blurred_image << pixel
          else
            2.times {blurred_image << 1}
            previous_one = true
          end
          if index > 0
            if blurred_image.length == (index * row.length + (inner_index+2))
              blurred_image[blurred_image.length-1 - row.length-1] = 1
            else
              blurred_image[blurred_image.length-1 - row.length] = 1
            end
          end
          if index < @data.length-1
            indices << [index + 1, inner_index]
          end
        end
      end
    end
    indices.each do |index_pair|
      blurred_image[index_pair[0]*@data[0].length + index_pair[1]] = 1
    end
    blurred_image.each_slice(4).to_a.each { |i| puts i.join }
  end
end


# image = Image.new([
#   [0, 0, 0, 0],
#   [0, 0, 0, 0],
#   [0, 0, 0, 0],
#   [0, 1, 0, 0],
#   [0, 0, 0, 0],
#   [0, 0, 0, 0]
# ])

# image.blur