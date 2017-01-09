def greeting
	ARGV.each do |arg|
		puts "#{ARGV[0]} #{arg}" unless ARGV[0] == arg
	end
end

greeting