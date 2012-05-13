class BackuperLocal
	def initialize(config)
		@host = config[:host]
		@username = config[:username]
		@port = config[:port] || '22'
		@remote_dir = config[:remote_dir]
		@local_dir = config[:local_dir]
		@verbose = config[:verbose]
	end

	def run
		options = '-a'

		if @verbose
			options += 'v'
		end

		custom_command = @port == 22 ? '' : "-e 'ssh -p #{@port}'"
		command = "rsync #{options} #{custom_command} #{@username}@#{@host}:#{@remote_dir} #{@local_dir}"
		puts "Executing... "+command
		system(command)
	end
end
