def GetConnectionString():
    driver = "{SQL Server}"
    server = "LOCALHOST\\SQLEXPRESS"
    database = "Rentals"
    username = "sa"
    password = "xxxx"
    connectionString = "DRIVER=" + driver + ";SERVER=" + server + ";DATABASE=" + database + ";UID=" + username + ";PWD=" + password
    return connectionString
