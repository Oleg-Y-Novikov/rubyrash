class SeveFaceInFile

@@path = nil

  def self.save(string)
    time = Time.now
    file_name = "face_#{time.strftime("%Y-%m-%d_%H:%M")}"
    @@path = File.dirname(__FILE__) + "/image/#{file_name}.txt"
    file = File.new(@@path, "a")
    file.puts(string)
    file.close
  end

  def self.path
    @@path
  end
end