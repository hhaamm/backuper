class BackuperRemote
	def initialize(config)
		@backups = config[:backups]
		@tmp_folder = config[:tmp_folder]
		@rotations = config[:rotations]
		@destiny_path = config[:destiny_path]
		@date_format = config[:date_format] ? config[:date_format] : '%Y_%m_%d'
	end

	def run
		config = {:tmp_folder => @tmp_folder}
		check_folders
		@backups.each do |backup|
			backup.set_config config
			begin
				backup.run
			rescue Exception => e
				puts e
				puts "Canceling backup #{backup.name}"
			end
		end

		filename = File.join(@destiny_path, Time.now.strftime(@date_format)+'.tar.gz')
		puts "Filename: #{filename}"
		system("tar -cf #{filename} #{@tmp_folder}")

		rotate_files
	end

	def check_config

	end

	def rotate_files
		if !@rotations
			return
		end

		files = Dir[File.join(@destiny_path, '**', '*')].sort

		for i in (@rotations..(files.length-1)) do
			File.delete(files[i])
		end
	end

	def check_folders
		if File.directory? @tmp_folder
			FileUtils.rm_rf @tmp_folder
		end
		Dir.mkdir @tmp_folder
		if !Dir.exists? @destiny_path
			Dir.mkdir @destiny_path
		end
	end
end
