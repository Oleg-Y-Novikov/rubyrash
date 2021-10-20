current_path = File.dirname(__FILE__)
file_foreheads = current_path + "/data/foreheads.txt"
file_noses = current_path + "/data/noses.txt"
file_eyes = current_path + "/data/eyes.txt"
file_mouths = current_path + "/data/mouths.txt"

def generate_fase(route)
  if File.exist?(route)
    f = File.new(route, "r")
    part_of_the_face = f.readlines
    f.close
    puts part_of_the_face.sample
  else
    puts "Фаил не найден"
  end
end

generate_fase(file_foreheads)
generate_fase(file_eyes)
generate_fase(file_noses)
generate_fase(file_mouths)