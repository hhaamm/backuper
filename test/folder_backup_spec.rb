require '../lib/include.rb'
require './config.rb'

include TestConfig

describe FolderBackup do
	describe "#run" do
		it "copies files from a folder to the tmp folder" do
			#creating TMP_FOLDER if it doesn't exists
			if !File.directory?(TMP_FOLDER)
				Dir.mkdir TMP_FOLDER
			end

			#deleting previous files
			FileUtils.rm_rf(File.join(TMP_FOLDER, 'folder_backup'))

			folder_backup = FolderBackup.new(:path => './files', :folder_name => 'folder_backup')
			config = {:tmp_folder => TMP_FOLDER}

			folder_backup.set_config config
			folder_backup.run

			destiny_folder = File.join(TMP_FOLDER, 'folder_backup')
			File.directory?(destiny_folder).should == true

			#checking we have the same quantity of files
			pattern = File.join('./files', "**", "*")
			puts pattern
			origin_files = Dir.glob(pattern).count
			puts Dir.glob(pattern)

			pattern = File.join(destiny_folder, "**", "*")
			puts pattern
			puts Dir.glob(pattern)
			Dir.glob(pattern).count.should eq(origin_files)
		end
	end
end
