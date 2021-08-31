import uuid
import hashlib
import translation
import settings

class User:
    #def __init__(self):        

    def login(self):    
        # establish database connection
        import pyodbc    
        import database
        connectionString = database.GetConnectionString()   
        conn = pyodbc.connect(connectionString)

        hashed_password = ""

        # perform query and print result
        self.user_name = input("Please enter username: ") 
        query_search = "SELECT Password, Role, LanguageID FROM Access WHERE UserName  = ?"
        cursor_search = conn.cursor()
        cursor_search.execute(query_search, self.user_name)

        for row in cursor_search:        
            #print(row.Password, row.Role, row.LanguageID)     
            self.user_role = row.Role
            self.user_language = get_userlanguage(self.user_name)
            #hashed_password = "3009b0c8aba8dc7be358aeed08a11a5895e104dfbd8da44fccb265c1f0ef9eaf:583e7bac4a5241739aa4da2936b6680c" # test  med bruker ivar og passord ivar123         
            hashed_password = row.Password.strip()  # remove spaces

        # tidy up and move on
        cursor_search.close()          
        conn.close()
        
        entered_password = input("Please enter password: ")
        if check_password(hashed_password, entered_password):
            self.user_auth = "OK"             
        else:    
            self.user_auth = "FAILED"
            self.user_role = ""
            self.user_language = "EN"
            print("Authorization: " + self.user_auth)

    def reset_password(self):
        new_pass = input('Please enter a password: ')
        hashed_password = hash_password(new_pass)
        # TODO write to database
        update_password(self.user_name, new_pass)

        print('The string to store in the db is: ' + hashed_password)
        self.user_auth = "NEW"  # user need to re-login
        # TODO Remove/clean up the below
        #old_pass = input('Now please enter the password again to check: ')
        #if check_password(hashed_password, old_pass):
        #    print('You entered the right password')
        #else:
        #    print('I am sorry but the password does not match')


def update_password(user_name, user_password):
    # establish database connection
    import database
    import pyodbc  
    connectionString = database.GetConnectionString()   
    conn = pyodbc.connect(connectionString)
    #rowsAffected = 0   # problems getting rows affected from MS SQL...

    try:
        # create query and run it      
        SQL = r'exec dbo.SP_ChangePassword @UserName = ' + "'" + str(user_name) + "' " + '@user_password = ' + "'" + str(user_password) + "'"
        cursor = conn.cursor()
        cursor.execute(SQL)
        conn.commit()
        print("Oppdateringsoperasjon forsøkt.")
    except pyodbc.Error as err:
        print("Feil!")
        print("Databasefeil: %s" % err)
    except:
        print("Generell feil!")
    finally:
        cursor.close()
        conn.close()        


def get_userlanguage(user_name):
    # establish database connection
    import pyodbc    
    import database
    connectionString = database.GetConnectionString()   
    conn = pyodbc.connect(connectionString)

    # perform query and print result
    query_search = 'SELECT LanguageCode FROM Language WHERE LanguageID = (SELECT LanguageID FROM Access  WHERE UserName = ?)'
    cursor_search = conn.cursor()
    cursor_search.execute(query_search, user_name)

    for row in cursor_search:        
        lang_code = row.LanguageCode
            
    # tidy up and move on
    cursor_search.close()          
    conn.close()    
    return lang_code

def set_user_language(new_user_language, user_name):
    #print("Ready to set user language: " + new_user_language)

    # establish database connection
    import pyodbc   
    import database
    connectionString = database.GetConnectionString()   
    conn = pyodbc.connect(connectionString)

    # create cursor    
    cursor_insert = conn.cursor()
    cursor_insert.execute("UPDATE Access SET LanguageID = ? WHERE UserName = ?", new_user_language,user_name)
    cursor_insert.commit()

    # tidy up and move on
    cursor_insert.close()          
    conn.close()     

 
def hash_password(password):
    # uuid is used to generate a random number
    salt = uuid.uuid4().hex
    return hashlib.sha256(salt.encode() + password.encode()).hexdigest() + ':' + salt
    
def check_password(hashed_password, user_password):
    password, salt = hashed_password.split(':')
    return password == hashlib.sha256(salt.encode() + user_password.encode()).hexdigest()


