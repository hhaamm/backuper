class BackuperSync
  def initialize(config)
    @host = config[:host]
    @username = config[:username]
    @port = config[:port] || '22'
    @remote_dir = config[:remote_dir]
    @local_dir = config[:local_dir]
    @verbose = config[:verbose]
    @remote_backuper_dir = config[:remote_backuper_dir]
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

  def sync_remote_config
    options = '-a'
    custom_command = @port == 22 ? '' : "-e 'ssh -p #{@port}'"

    local_config_file = 'remote_config.rb'
    remote_config_file = File.join(@remote_backuper_dir, 'remote_config.rb')
    command = "rsync #{options} #{custom_command} #{local_config_file} #{@username}@#{@host}:#{remote_config_file}"
    puts "Executing... "+command
    system(command)
  end
end
