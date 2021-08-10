def GetTranslatedText(tag, languageCode):
    # establish database connection
    import database
    import pyodbc  
    connectionString = database.GetConnectionString()   
    conn = pyodbc.connect(connectionString)
    #rowsAffected = 0   # problems getting rows affected from MS SQL...    

    try:
        # create query and run it      
        SQL = r'exec dbo.SP_GetGetTranslatedText @tag = ' + "'" + str(tag) + "', " + '@language_code = '+ "'" + str(languageCode) + "'"
        cursor = conn.cursor()
        cursor.execute(SQL)    
        translated_text = cursor.fetchone().Text
        
        #print(cursor.fetchone().Text)        
        #input("waiting...")
     
    except pyodbc.Error as err:        
        print("Databasefeil: %s" % err)
    except:
        print("Generell feil!")
    finally:
        cursor.close()
        conn.close()     
        return translated_text   

