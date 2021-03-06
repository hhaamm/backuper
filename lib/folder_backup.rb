class FolderBackup
  def initialize(config)
    @path = config[:path]
    @tmp_folder = config[:tmp_folder]
    @folder_name = @name = config[:name]
  end

  def run
    destiny_dir = File.join(@tmp_folder, @folder_name)
    Dir.mkdir destiny_dir
    @path = File.join(@path, '.')
    FileUtils.cp_r @path, destiny_dir
  end

  def set_config(config)
    @tmp_folder = config[:tmp_folder]
  end

  def name
    @name
  end
end
