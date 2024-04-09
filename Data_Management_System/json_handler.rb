require 'json'

class JsonHandler
    def initialize(file_path)
        @file_path = file_path
        @data = {}
        load_data
    end

    def load_data
        # load file data
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
        if entity_name == "Networks" or entity_name == "Schools" or entity_name == "Users"
            cond = if_already_exists?(entity_name, entity)
            puts cond
            if !cond
                puts "entity cannot be added.."
                return
            end
        end

        @data[entity_name] ||= []
        @data[entity_name] << entity.to_h
        save_data
    end

    def get_entity(entity_name)
        @data[entity_name] || []
    end

    def print_data
        @data.each do |entity_name, entities|
            puts "#{entity_name.capitalize}"
            entities.each do |entity|
                puts JSON.pretty_generate(entity)
            end
        end
    end

    def if_already_exists?(entity_name, entity)
        if entity_name == "Networks"
            account_id = entity["AccountID"]
            puts entity[:AccountID]
            return @data["Accounts"]&.any? { |acc| acc[:ID] == account_id }
        elsif entity_name == "Schools"
            network_id = entity[:NetworkID]
            return @data["Networks"]&.any? { |net| net[:ID] == network_id }
        else
            usertype = entity[:UserType]
            return @data["UserTypes"]&.any? { |utype| utype[:Name] == usertype }
        end
    end
end
