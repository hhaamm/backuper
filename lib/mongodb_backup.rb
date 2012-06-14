class MongoDBBackup
	def initialize(config)
          @db = config[:db]
          @username = config[:username]
          @password = config[:password]
          @host = config[:host] || 'localhost'
          @name = config[:name]
	end

        def run
          destiny_folder = File.join(@tmp_folder, @name)
          command="mongodump -d #{@db} -o #{destiny_folder}"
          if !system(command)
            puts "An error has ocurred while backuping MongoDB database '#{@db}'"
          end
	end

	def set_config(config)
          @tmp_folder = config[:tmp_folder]
	end

	def name
          @name
	end
end
