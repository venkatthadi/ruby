require_relative "json_handler.rb"

class Account
    def initialize(id, name)
        @id = id
        @name = name
    end

    def to_h
        {"ID": @id, "Name": @name}
    end
end

class Network
    def initialize(id, name, account_id)
        @id = id
        @name = name
        @account_id = account_id
    end

    def to_h
        {"ID": @id, "Name": @name, "AccountID": @account_id}
    end
end

class School
    def initialize(id, name, network_id)
        @id = id
        @name = name
        @network_id = network_id
    end

    def to_h
        {"ID": @id, "Name": @name, "NetworkID": @network_id}
    end
end

class UserType
    def initialize(id, name)
        @id = id
        @name = name
    end

    def to_h
        {"ID": @id, "Name": @name}
    end
end

class Users
    def initialize(id, email, type)
        @id = id
        @email = email
        @type = type
    end

    def to_h
        {"ID": @id, "Email": @email, "UserType": type}
    end
end


if __FILE__ == $PROGRAM_NAME
    f = JsonHandler.new("data.json")
    # f.add_entity("Account", {"name": "John"})
    print "Enter an option: \n"
    print "1. Account\n"
    print "2. Network\n"
    print "3. School\n"
    print "4. UserType\n"
    print "5. Users\n"
    print "6. Display contents\n"
    print "7. Exit\n"
    
    while 1
        option = gets.chomp.to_i
        case option
            when 1
                print "Enter an option: (Accounts)\n"
                print "1. Create\n"
                print "2. Read\n"
                print "3. Update\n"
                print "4. Delete\n"
                print "5. Exit\n"

                while 1
                    opt = gets.chomp.to_i
                    case opt
                        when 1
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            print "Enter name: "
                            name = gets.chomp
                            acc = Account.new(id, name)
                            f.add_entity("Accounts", acc.to_h)
                            
                        when 2
                            f.get_entity("Accounts").each do |acc|
                                puts acc
                            end
                        
                        when 3
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            f.get_entity("Accounts").each do |acc|
                                if acc["ID"] == id
                                    print "Enter new name: "
                                    name = gets.chomp
                                    acc["Name"] = name
                                    f.save_data
                                end
                            end
                        
                        when 4
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            f.get_entity("Accounts").each do |acc|
                                if acc["ID"] == id
                                    f.get_entity("Accounts").delete(acc)
                                    f.save_data
                                end
                            end
                        
                        when 5
                            break

                        # else
                        #     print "Invalid option, try again... (to exit choose 5)\n"
                    end
                end
            when 7
                break
                    
                    # else
                    #         print "Invalid option, try again... (to exit choose 7)\n"
        end
    end
end