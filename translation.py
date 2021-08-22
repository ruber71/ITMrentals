# DONE  Add function to add user language dynamically using Google translate?

def GoogleTranslate(language_code, text_eng):      
    # get translation from Google Translate API
    from googletrans import Translator
    translator = Translator()
    text_trans = translator.translate(text_eng, src='en', dest=language_code).text    
    return text_trans
    

def update_translations():
    # TODO create function that accept stored procedure name, runs it and handles errors
    # establish database connection
    import database
    import pyodbc  
    connectionString = database.GetConnectionString()   
    conn = pyodbc.connect(connectionString)
    #rowsAffected = 0   # problems getting rows affected from MS SQL...    

    try:
        # create query and run it      
        SQL = r'exec dbo.SP_TRANS_GetTranslationQueue'
        cursor = conn.cursor()
        cursor.execute(SQL)    
        
        for row in cursor.fetchall():
            trans_id = row[0]
            #language_id = row[1]
            language_code = row[2] 
            #trans_tag = row[3]       
            text_eng = row[4]
            text_trans = GoogleTranslate(language_code, text_eng)

            # update Translate-table with translation
            cursor.execute("UPDATE Translation SET Text = ? WHERE TranslationID = ?", text_trans, trans_id)
            cursor.commit()
             
    except pyodbc.Error as err:        
        print("Databasefeil: %s" % err)
    except:
        print("Generell feil!")
    finally:
        cursor.close()
        conn.close()     

#update_translations()

