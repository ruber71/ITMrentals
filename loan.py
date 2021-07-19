def get():
    # establish database connection
    import pyodbc     
    conn = pyodbc.connect('Driver={SQL Server};'
                                  'Server=LOCALHOST\SQLEXPRESS;'
                                  'Database=Rentals;'
                                  'Trusted_Connection=yes;')

    # perform query and print result
    query_search = '''
                    SELECT E.Barcode, E.Name, P.IdentityNumber, P.Name as PersonName, L.FromDate, L.ToDate 
                    FROM Loan L, Equipment E, Person P
                    WHERE L.EquipmentID = E.EquipmentID
                    AND L.PersonID = P.PersonID
                  '''
    cursor_search = conn.cursor()
    cursor_search.execute(query_search)

    column_concat = ""    
    for column in cursor_search.description:
        column_concat = column_concat + column[0] + "\t"
    print(column_concat)
    
    for row in cursor_search:        
        print(row.Barcode, row.Name, row.IdentityNumber, row.PersonName, row.FromDate, row.ToDate)

    # tidy up and move on
    cursor_search.close()          
    conn.close() 
    #input("Trykk ENTER for å gå videre!")

def insert():
    # let user enter equipment details
    barcode = input("Strekkode: ")
    identity_number = input("Lånenummer: ")
    
    from datetime import date    
    new_start_date = date.today().isoformat()
    
    # establish database connection
    import pyodbc     
    conn = pyodbc.connect('Driver={SQL Server};'
                                  'Server=LOCALHOST\SQLEXPRESS;'
                                  'Database=Rentals;'
                                  'USER=sa;'
                                  'PWD=sa12345;')
    # create cursor to find IDs
    cursor_find = conn.cursor()
    cursor_find.execute('''  
    SELECT EquipmentID
    FROM Equipment
    WHERE Barcode = ? 
    ''', barcode)
 
    row = cursor_find.fetchone()
    new_equipment_id = row.EquipmentID

    cursor_find.execute('''  
    SELECT PersonID
    FROM Person
    WHERE IdentityNumber = ? 
    ''', identity_number)

    row = cursor_find.fetchone()
    new_person_id = row.PersonID

    cursor_find.close()

    print(new_equipment_id)
    print(new_person_id)
    
    # create cursor
    cursor_insert = conn.cursor()
    cursor_insert.execute("insert into loan(EquipmentID, PersonID, FromDate) values (?, ?, ?)", new_equipment_id, new_person_id, new_start_date)
    cursor_insert.commit()

    # tidy up and move on
    cursor_insert.close()          
    conn.close()
    
    #input("Trykk ENTER for å gå videre!")

def returned():
    # let user enter equipment details
    barcode = input("Strekkode: ")    
    
    from datetime import date    
    update_end_date = date.today().isoformat()
    
    # establish database connection
    import pyodbc     
    conn = pyodbc.connect('Driver={SQL Server};'
                                  'Server=LOCALHOST\SQLEXPRESS;'
                                  'Database=Rentals;'
                                  'USER=sa;'
                                  'PWD=sa12345;')
    # create cursor to find IDs
    cursor_find = conn.cursor()
    cursor_find.execute('''  
    SELECT EquipmentID
    FROM Equipment
    WHERE Barcode = ? 
    ''', barcode)
 
    row = cursor_find.fetchone()
    update_equipment_id = row.EquipmentID

    cursor_find.close()

    print(update_equipment_id)
    
    # create cursor
    cursor_update = conn.cursor()
    cursor_update.execute("UPDATE [Loan] SET [ToDate] = ? WHERE [EquipmentID] = ?",update_end_date, update_equipment_id)   
    
    cursor_update.commit()

    # tidy up and move on
    cursor_update.close()          
    conn.close()
    
    #input("Trykk ENTER for å gå videre!")
    
