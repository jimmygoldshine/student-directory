def source_code
  File.open(__FILE__, 'r') do |s|
    while line = s.gets
      puts line
    end
  end
end

source_code
