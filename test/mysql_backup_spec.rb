require '../lib/include.rb'
require './config.rb'

include TestConfig

describe MySQLBackup do
	describe "#run" do
		it "should create an sql file with the content of the given database" do
			if !File.directory?(TMP_FOLDER)
	                                Dir.mkdir TMP_FOLDER
			end

			backuper = MySQLBackup.new(:db => DB_NAME, :username => DB_USER, :password => DB_PASS, :name => DB_NAME)
			backuper.set_config(:tmp_folder => TMP_FOLDER)

			backuper.run

			File.exists?(File.join(TMP_FOLDER, DB_NAME+'.sql')).should == true
		end
	end
end
