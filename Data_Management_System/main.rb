require_relative "json_handler.rb"

'''
1. Account - {id, name} - Can be multiple Accounts
2. Network - {id, name, account_id} - Belongs to an Account.
3. School - {id, name, network_id} - Belongs to Network
4. UserType - {id, name} - Same UserType can exist in multiple schools
5. Users - {id, email, usertype} - User will have UserType & Belongs to a single School.

to_h: creates a hash({key: value} pairs) from the object.

rails version: 2.7.2
'''

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
        {"ID": @id, "Email": @email, "UserType": @type}
    end
end

# we need to check if the email is valid or not (ex: test@test.com(valid), test-123.com(invalid))
def valid_email?(email)
    email_re = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\Z/
    email =~ email_re
end



if __FILE__ == $PROGRAM_NAME
    # opens a new file or load already existing file 
    f = JsonHandler.new("data.json")

    while 1
        # display menu of entities
        print "Enter an option: \n"
        print "1. Account\n"
        print "2. Network\n"
        print "3. School\n"
        print "4. UserType\n"
        print "5. Users\n"
        print "6. Display contents\n"
        print "7. Exit\n"
    
        option = gets.chomp.to_i
        case option
            # option for accounts section 
            when 1
                while 1
                    print "Enter an option: (Accounts)\n"
                    print "1. Create\n"
                    print "2. Read\n"
                    print "3. Update\n"
                    print "4. Delete\n"
                    print "5. Exit\n"

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
                            # print each entity
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
                                if acc[:ID] == id
                                    print "Enter new name: "
                                    name = gets.chomp
                                    acc[:Name] = name
                                    f.save_data
                                end
                            end
                        
                        when 4
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            # delete entity if it exists
                            f.get_entity("Accounts").each do |acc|
                                if acc["ID"] == id
                                    f.get_entity("Accounts").delete(acc)
                                    f.save_data
                                end
                                if acc[:ID] == id
                                    f.get_entity("Accounts").delete(acc)
                                    f.save_data
                                end
                            end
                        
                        when 5
                            break

                        else
                            # default case
                            print "Invalid option, try again... (to exit choose 5)\n"
                    end
                end
            
            when 2
                while 1
                    print "Enter an option: (Networks)\n"
                    print "1. Create\n"
                    print "2. Read\n"
                    print "3. Update\n"
                    print "4. Delete\n"
                    print "5. Exit\n"
                
                    opt = gets.chomp.to_i
                    case opt
                        when 1
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            print "Enter name: "
                            name = gets.chomp
                            print "Enter account ID: "
                            account_id = gets.chomp.to_i
                            net = Network.new(id, name, account_id)
                            f.add_entity("Networks", net.to_h)
    
                        when 2
                            f.get_entity("Networks").each do |net|
                                puts net
                            end
    
                        when 3
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            f.get_entity("Networks").each do |net|
                                if net["ID"] == id
                                    print "Enter new name: "
                                    name = gets.chomp
                                    net["Name"] = name
                                    print "Enter new account ID: "
                                    account_id = gets.chomp.to_i
                                    net["AccountID"] = account_id
                                    f.save_data
                                end
                                if net[:ID] == id
                                    print "Enter new name: "
                                    name = gets.chomp
                                    net[:Name] = name
                                    print "Enter new account ID: "
                                    account_id = gets.chomp.to_i
                                    net[:AccountID] = account_id
                                    f.save_data
                                end
                            end
    
                        when 4
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            f.get_entity("Networks").each do |net|
                                if net["ID"] == id
                                    f.get_entity("Networks").delete(net)
                                    f.save_data
                                end
                                if net[:ID] == id
                                    f.get_entity("Networks").delete(net)
                                    f.save_data
                                end
                            end
    
                        when 5
                            break
    
                        else
                            print "Invalid option, try again... (to exit choose 5)\n"
                    end
                end

            when 3
                while 1
                    print "Enter an option: (Schools)\n"
                    print "1. Create\n"
                    print "2. Read\n"
                    print "3. Update\n"
                    print "4. Delete\n"
                    print "5. Exit\n"
    
                    opt = gets.chomp.to_i
                    case opt
                        when 1
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            print "Enter name: "
                            name = gets.chomp
                            print "Enter network ID: "
                            network_id = gets.chomp.to_i
                            school = School.new(id, name, network_id)
                            f.add_entity("Schools", school.to_h)
    
                        when 2
                            f.get_entity("Schools").each do |school|
                                puts school
                            end
    
                        when 3
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            f.get_entity("Schools").each do |school|
                                if school["ID"] == id
                                    print "Enter new name: "
                                    name = gets.chomp
                                    net["Name"] = name
                                    print "Enter new network ID: "
                                    network_id = gets.chomp.to_i
                                    net["NetworkID"] = network_id
                                    f.save_data
                                end
                                if school[:ID] == id
                                    print "Enter new name: "
                                    name = gets.chomp
                                    net[:Name] = name
                                    print "Enter new network ID: "
                                    network_id = gets.chomp.to_i
                                    net[:NetworkID] = network_id
                                    f.save_data
                                end
                            end
    
                        when 4
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            f.get_entity("Schools").each do |school|
                                if school["ID"] == id
                                    f.get_entity("Schools").delete(school)
                                    f.save_data
                                end
                                if school[:ID] == id
                                    f.get_entity("Schools").delete(school)
                                    f.save_data
                                end
                            end
    
                        when 5
                            break
    
                        else
                            print "Invalid option, try again... (to exit choose 5)\n"
                    end
                end

            when 4
                while 1
                    print "Enter an option: (UserType)\n"
                    print "1. Create\n"
                    print "2. Read\n"
                    print "3. Update\n"
                    print "4. Delete\n"
                    print "5. Exit\n"
                
                    opt = gets.chomp.to_i
                    case opt
                        when 1
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            print "Enter name: "
                            name = gets.chomp
                            usertype = UserType.new(id, name)
                            f.add_entity("UserTypes", usertype.to_h)
    
                        when 2
                            f.get_entity("UserTypes").each do |utype|
                                puts utype
                            end
    
                        when 3
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            f.get_entity("UserTypes").each do |utype|
                                if utype["ID"] == id
                                    print "Enter new name: "
                                    name = gets.chomp
                                    utype["Name"] = name
                                    f.save_data
                                end
                                if utype[:ID] == id
                                    print "Enter new name: "
                                    name = gets.chomp
                                    utype[:Name] = name
                                    f.save_data
                                end
                            end
    
                        when 4
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            f.get_entity("UserTypes").each do |utype|
                                if utype["ID"] == id
                                    f.get_entity("UserTypes").delete(utype)
                                    f.save_data
                                end
                                if utype[:ID] == id
                                    f.get_entity("UserTypes").delete(utype)
                                    f.save_data
                                end
                            end
    
                        when 5
                            break
    
                        else
                            print "Invalid option, try again... (to exit choose 5)\n"
                    end
                end

            when 5
                while 1
                    
                    print "Enter an option: (Users)\n"
                    print "1. Create\n"
                    print "2. Read\n"
                    print "3. Update\n"
                    print "4. Delete\n"
                    print "5. Exit\n"

                    opt = gets.chomp.to_i
                    case opt
                        when 1
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            print "Enter E-Mail: "
                            email = gets.chomp
                            if valid_email?(email)
                                puts "valid email"
                            else
                                puts "invalid email"
                                until valid_email?(email)
                                    print "Enter E-Mail: "
                                    email = gets.chomp
                                end
                            end
                            print "Enter usertype: "
                            usertype = gets.chomp
                            user = Users.new(id, email, usertype)
                            f.add_entity("Users", user.to_h)
    
                        when 2
                            f.get_entity("Users").each do |user|
                                puts user
                            end
    
                        when 3
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            f.get_entity("Users").each do |user|
                                if user["ID"] == id
                                    print "Enter new name: "
                                    email = gets.chomp
                                    if valid_email?(email)
                                        puts "valid email"
                                    else
                                        puts "invalid email"
                                        until valid_email?(email)
                                            print "Enter E-Mail: "
                                            email = gets.chomp
                                        end
                                    end
                                    user["Email"] = email
                                    print "Enter new usertype: "
                                    usertype = gets.chomp.to_i
                                    user["UserType"] = usertype
                                    f.save_data
                                end
                                if user[:ID] == id
                                    print "Enter new name: "
                                    email = gets.chomp
                                    if valid_email?(email)
                                        puts "valid email"
                                    else
                                        puts "invalid email"
                                        until valid_email?(email)
                                            print "Enter E-Mail: "
                                            email = gets.chomp
                                        end
                                    end
                                    user[:Email] = email
                                    print "Enter new usertype: "
                                    usertype = gets.chomp.to_i
                                    user[:UserType] = usertype
                                    f.save_data
                                end
                            end
    
                        when 4
                            print "Enter ID: "
                            id = gets.chomp.to_i
                            f.get_entity("Users").each do |user|
                                if user["ID"] == id
                                    f.get_entity("Users").delete(user)
                                    f.save_data
                                end
                                if user[:ID] == id
                                    f.get_entity("Users").delete(user)
                                    f.save_data
                                end
                            end
    
                        when 5
                            break
    
                        else
                            print "Invalid option, try again... (to exit choose 5)\n"
                    end
                end

            when 6
                f.print_data
            
            when 7
                break
                    
            else
                    print "Invalid option, try again... (to exit choose 7)\n"
        end
    end
end