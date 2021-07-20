def get():
    # establish database connection
    import pyodbc     
    conn = pyodbc.connect('Driver={SQL Server};'
                                  'Server=LOCALHOST\SQLEXPRESS;'
                                  'Database=Rentals;'
                                  'Trusted_Connection=yes;')

    # perform query and print result
    query_search = "SELECT * FROM Person"
    cursor_search = conn.cursor()
    cursor_search.execute(query_search)
    for row in cursor_search:        
        print(row.PersonID, row.IdentityNumber, row.Name, row.Mobile, row.Role, row.Class)

    # tidy up and move on
    cursor_search.close()          
    conn.close() 
    input("Trykk ENTER for å gå videre!")

def insert():
    # let user enter person details
    new_identity_number = input("Skriv inn lånenummer: ")
    new_name = input("Skriv fullt navn: ")    
    new_mobile = input("Skriv inn mobilnummer: ")
    new_role = input("Skriv inn rolle: ")
    new_class = input("Skriv inn klasse: ")
    
    # establish database connection
    import pyodbc     
    conn = pyodbc.connect('Driver={SQL Server};'
                                  'Server=LOCALHOST\SQLEXPRESS;'
                                  'Database=Rentals;'
                                  'USER=sa;'
                                  'PWD=sa12345;')
    # create cursor    
    cursor_insert = conn.cursor()
    cursor_insert.execute("insert into person(IdentityNumber, name, mobile, role, class) values (?, ?, ?, ?, ?)", new_identity_number, new_name, new_mobile, new_role, new_class)
    cursor_insert.commit()

    # tidy up and move on
    cursor_insert.close()          
    conn.close()

    get()
    input("Trykk ENTER for å gå videre!")
    



def delete():
    # let user enter person to delete
    print("Sletting av lånetaker.")
    del_identity_number = input("Skriv inn lånenummer: ")
    
    # establish database connection
    import pyodbc     
    conn = pyodbc.connect('Driver={SQL Server};'
                                  'Server=LOCALHOST\SQLEXPRESS;'
                                  'Database=Rentals;'
                                  'USER=sa;'
                                  'PWD=sa12345;')

    rowsAffected = 0   

    try:
        # create query and run it      
        SQL = r'exec dbo.SP_DeletePerson @IdentityNumber = ' + "'" + str(del_identity_number) + "'"
        #print(SQL)
        cursor = conn.cursor()
        cursor.execute(SQL)
        conn.commit()
        print("Sletteoperasjon forsøkt.")
    except pyodbc.Error as err:
        print("Ugyldig format på lånenummer eller annen feil!")
        print("Databasefeil: %s" % err)
    except:
        print("Generell feil!")
    finally:
        cursor.close()
        conn.close()        
        get()
        print("Sjekk i listen over om lånenummer ble slettet.")
        input("Trykk ENTER for å gå videre!")

