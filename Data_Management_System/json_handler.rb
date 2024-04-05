require 'json'

class JsonHandler
    def initialize(file_path)
        @file_path = file_path
        @data = {}
        load_data
    end

    def load_data
        if File.exist?(@file_path)
            file = File.read(@file_path)
            @data = JSON.parse(file)
        end
    end

    def save_data
        File.open(@file_path, 'w') do |file|
            file.write(JSON.pretty_generate(@data))
        end
    end

    def add_entity(entity_name, entity)
        @data[entity_name] ||= []
        @data[entity_name] << entity.to_h 
        save_data
    end

    def get_entity(entity_name)
        @data[entity_name] || []
    end
end