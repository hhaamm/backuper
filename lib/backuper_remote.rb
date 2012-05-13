class BackuperRemote
	def initialize(config)
		@backups = config[:backups]
		@tmp_folder = config[:tmp_folder]
		@rotations = config[:rotations]
		@destiny_path = config[:destiny_path]
	end

	def run
		check_folders
	end

	def check_config

	end

	def check_folders
		if File.directory? @tmp_folder
			FileUtils.rm_rf @tmp_folder
		end
		Dir.mkdir @tmp_folder

		if !File.directory? @destiny_path
			Dir.mkdir @destiny_path
		end
	end
end
