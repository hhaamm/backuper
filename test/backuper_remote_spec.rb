require '../lib/include.rb'
require 'config.rb'

describe BackuperRemote do
	describe "#check_folders" do
		it "create folders if folders doesn't exists yet" do
			# deleting if directories exists
			if File.directory? test_tmp_folder
				puts "Deleting #{test_tmp_folder}"
				FileUtils.rm_rf test_tmp_folder
			end

			if File.directory? test_destiny_path
				puts "Deleting #{test_destiny_path}"
				FileUtils.rm_rf test_destiny_path
			end

			backuper = BackuperRemote.new(:tmp_folder => test_tmp_folder, :destiny_path => test_destiny_path)
			backuper.check_folders

			File.directory?(test_tmp_folder).should == true
			File.directory?(test_destiny_path).should == true
		end
	end

	describe "#run" do
		it "creates a backup for a mix with folders and mysql databases" do

		end
	end
end
