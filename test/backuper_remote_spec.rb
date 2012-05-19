require '../lib/include.rb'
require './config.rb'

include TestConfig

def clean
	# deleting if directories exists
	if File.directory? TMP_FOLDER
		puts "Deleting #{TMP_FOLDER}"
		FileUtils.rm_rf TMP_FOLDER
	end

	if File.directory? DESTINY_PATH
		puts "Deleting #{DESTINY_PATH}"
		FileUtils.rm_rf DESTINY_PATH
	end
end

describe BackuperRemote do
	describe "#check_folders" do
		it "create folders if folders doesn't exists yet" do
			clean

			backuper = BackuperRemote.new(:tmp_folder => TMP_FOLDER, :destiny_path => DESTINY_PATH)
			backuper.check_folders

			File.directory?(TMP_FOLDER).should == true
			File.directory?(DESTINY_PATH).should == true
		end
	end

	describe '#rotate_files' do
		it "deletes old backup files when there are more backups than the specified in rotations config option" do
			clean

			backuper = BackuperRemote.new(:tmp_folder => TMP_FOLDER, :destiny_path => DESTINY_PATH, :rotations => 2, :date_format => "%m_%e_%y_%H_%M_%S", :backups => [FolderBackup.new(:path => './files', :name => 'test_folder')])

			Dir.mkdir DESTINY_PATH

			# we copy 3 arbitrary files to the dir...
			FileUtils.cp_r './files/.', DESTINY_PATH
			backuper.rotate_files

			# we specified only 2 rotations, that means that there should be only two files in the folder
			file_count = Dir[File.join(DESTINY_PATH, '**', '*')].count { |file| File.file?(file) }
			file_count.should == 2
		end
	end

	describe "#run" do
		it "creates a backup for a mix with folders and mysql databases" do

		end
	end
end
