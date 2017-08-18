class ManhattanImage
  attr_accessor :image

  def initialize(image)
    @image = image
  end

  def output_image
    @image.each { |row| puts row.join }
  end

  def manhattan_distance_blur(distance, image=nil)
    image ||= @image

    blurred_image = Array.new(image.length) { Array.new(image[0].length, 0) }
   
    image.each_with_index do |row, i|
      row.each_with_index do |pixel, j|
        if pixel == 1
          blurred_image[i][j] = 1                             # SAME ROW AND COLUMN
          if j >= distance
            blurred_image[i][j-1] = 1                         # LEFT
          end
          if i >= distance
            blurred_image[i-1][j] = 1                         # TOP
          end
          if row.length > (j+1)
            blurred_image[i][j+1] = 1                         # RIGHT
          end
          if image.length > (i+distance)
            blurred_image[i+1][j] = 1                         # BOTTOM
          end
        end
      end
    end

    if distance > 1
      manhattan_distance_blur(distance-1, blurred_image)
    else
      blurred_image.each { |row| puts row.join }
    end
  end
end


# image = Image.new([
# [1,0,0,0,0,0,0,0],
# [0,0,0,0,0,0,0,0],
# [0,0,0,0,0,0,0,0],
# [0,0,0,0,0,1,0,0],
# [0,0,0,0,0,0,0,0],
# [0,0,0,0,0,0,0,0]
# ])

# image.manhattan_distance_blur(3)