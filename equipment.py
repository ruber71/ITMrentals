
def get():
    # establish database connection
    import pyodbc    
    import database
    connectionString = database.GetConnectionString()   
    conn = pyodbc.connect(connectionString)

    # perform query and print result
    query_search = "SELECT * FROM Equipment"
    cursor_search = conn.cursor()
    cursor_search.execute(query_search)

    print("")
    for row in cursor_search:        
        print(row.EquipmentID, row.Barcode, row.Name, row.Description, row.Accessories)        
    

    # tidy up and move on
    cursor_search.close()          
    conn.close()
    input("Trykk ENTER for å gå videre!")
    

def insert():
    # let user enter equipment details
    new_barcode = input("Skriv inn strekkode: ")
    new_name = input("Skriv utstyrsnavn: ")
    new_status = "Lager: "
    new_description = input("Skriv inn evt. beskrivelse: ")
    new_accessories = input("Skriv inn evt. tilbehør: ")
    
    # establish database connection
    import pyodbc   
    import database
    connectionString = database.GetConnectionString()   
    conn = pyodbc.connect(connectionString)

    # create cursor    
    cursor_insert = conn.cursor()
    cursor_insert.execute("insert into equipment(barcode, name, status, description, accessories) values (?, ?, ?, ?, ?)", new_barcode, new_name, new_status, new_description, new_accessories)
    cursor_insert.commit()

    # tidy up and move on
    cursor_insert.close()          
    conn.close()

    get()
    #input("Trykk ENTER for å gå videre!")

def delete():
    # let user enter equipment to delete
    print("Sletting av utstyr.")
    del_barcode = input("Skriv inn strekkode: ")
    
    # establish database connection
    import pyodbc
    import database
    connectionString = database.GetConnectionString()   
    conn = pyodbc.connect(connectionString)
 
    # create cursor    
    cursor_delete = conn.cursor()    

    cursor_delete.execute('''
                DELETE FROM Equipment 
                WHERE Barcode = (?)
               '''
                , del_barcode)
          
    cursor_delete.commit()

    # tidy up and move on
    cursor_delete.close()          
    conn.close()
    
    #input("Trykk ENTER for å gå videre!")
    get()

    
