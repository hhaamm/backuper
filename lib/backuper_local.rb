class BackuperLocal
	def initialize(config)
		@host = config[:host]
		@username = config[:username]
		@port = config[:port] || '22'
		@remote_dir = config['remote_dir']
		@local_dir = config['local_dir']
	end

	def run
		system("rsync -a #{@username}@#{@host}:#{@remote_dir} #{@local_dir}")
	end
end
