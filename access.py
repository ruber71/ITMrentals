import uuid
import hashlib
import translation

def login():
    ask_username = translation.GetTranslatedText("TYPEUSERNAME", "NO").strip()
    user_name = input(ask_username)
    ask_password = translation.GetTranslatedText("TYPEPWD", "NO").strip()
    entered_password = input(ask_password)
    hashed_password = "3009b0c8aba8dc7be358aeed08a11a5895e104dfbd8da44fccb265c1f0ef9eaf:583e7bac4a5241739aa4da2936b6680c" # test  med bruker ivar. 
    # TODO Neeed to get this from SQL using query
    
    if check_password(hashed_password, entered_password):
        return user_name
    else:    
        return "AUTH_FAILURE"

# TODO Create password reset function

def hash_password(password):
    # uuid is used to generate a random number
    salt = uuid.uuid4().hex
    return hashlib.sha256(salt.encode() + password.encode()).hexdigest() + ':' + salt
    
def check_password(hashed_password, user_password):
    password, salt = hashed_password.split(':')
    return password == hashlib.sha256(salt.encode() + user_password.encode()).hexdigest()
 
# TODO Remove/clean up the below
#new_pass = input('Please enter a password: ')
#hashed_password = hash_password(new_pass)
#print('The string to store in the db is: ' + hashed_password)
#old_pass = input('Now please enter the password again to check: ')
#if check_password(hashed_password, old_pass):
#    print('You entered the right password')
#else:
#    print('I am sorry but the password does not match')