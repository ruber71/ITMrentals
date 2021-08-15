import uuid
import hashlib
import translation
import settings

class User:
    #def __init__(self):        

    def login(self):    
        self.user_name = input("Please enter username: ") 
        entered_password = input("Please enter password: ")
        hashed_password = "3009b0c8aba8dc7be358aeed08a11a5895e104dfbd8da44fccb265c1f0ef9eaf:583e7bac4a5241739aa4da2936b6680c" # test  med bruker ivar.         
        # TODO Neeed to get this from SQL using query
        
        if check_password(hashed_password, entered_password):
            self.user_auth = "OK"
            self.user_role = "ADMIN"   
            self.user_language = settings.get_user_language(self.user_name)
        else:    
            self.user_auth = "FAILED"
            self.user_role = ""

def hash_password(password):
    # uuid is used to generate a random number
    salt = uuid.uuid4().hex
    return hashlib.sha256(salt.encode() + password.encode()).hexdigest() + ':' + salt
    
def check_password(hashed_password, user_password):
    password, salt = hashed_password.split(':')
    return password == hashlib.sha256(salt.encode() + user_password.encode()).hexdigest()

# TODO Create password reset function
# TODO Remove/clean up the below
#new_pass = input('Please enter a password: ')
#hashed_password = hash_password(new_pass)
#print('The string to store in the db is: ' + hashed_password)
#old_pass = input('Now please enter the password again to check: ')
#if check_password(hashed_password, old_pass):
#    print('You entered the right password')
#else:
#    print('I am sorry but the password does not match')
