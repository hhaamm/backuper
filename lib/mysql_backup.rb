class MySQLBackup
	def initialize(config)
		@db = config[:db]
		@username = config[:username]
		@password = config[:password]
		@host = config[:host] || 'localhost'
		@name = config[:name]
	end

	def run
		destiny_file = File.join(@tmp_folder, @name+'.sql')
		command = "mysqldump -u #{@username} --password=#{@password} #{@db} > #{destiny_file}"
		puts command
		if !system(command)
			puts "An error has ocurred while backuping MySQL database '#{@db}'"
		end
	end

	def set_config(config)
		@tmp_folder = config[:tmp_folder]
	end

	def name
		@name
	end
end
