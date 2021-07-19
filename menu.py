import person
import equipment
import loan

while True:
    import subprocess as sp
    sp.call('cls', shell=True)
    
    # print menu and read user choice
    print("")
    print("*** Velkommen til ITM Utlånssytem ***")
    print(" 1. Nytt utlån*")
    print(" 2. Innlevering*")
    print(" 3. Vis utlån*")

    print("10. Vis lånere*")
    print("11. Ny låner*")    
    print("12. Slett låner*")
    print("13. Endre låner")

    print("20. Vis utstyr*")
    print("21. Nytt utstyr*")    
    print("22. Slett utstyr*")
    print("23. Endre utstyr")
    
    print("30. Statistikk")
    print(" 0. Avslutt")        
    menu_selection = input("Valg:")

    # go to chosen function
    if menu_selection == "1":
        loan.insert()
    elif menu_selection == "2":
        loan.returned()
    elif menu_selection == "3":
        loan.get()        
    elif menu_selection == "10":
        person.get()        
    elif menu_selection == "11":        
        person.insert()
    elif menu_selection == "12":
        person.delete()
    elif menu_selection == "13":
        print("13")
    elif menu_selection == "20":        
        equipment.get()
    elif menu_selection == "21":
        equipment.insert()        
    elif menu_selection == "22":
        equipment.delete() 
    elif menu_selection == "23":
        print("23")
    elif menu_selection == "30":
        print("30")
    elif menu_selection == "0":
        break        
    else:
        print("*** Menyvalg finnes ikke...")
exit("Ha det...")




    


