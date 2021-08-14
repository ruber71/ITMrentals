import person
import equipment
import loan
import autotest
import translation
import access
import settings
import subprocess as sp
sp.call('cls', shell=True)

# login
print("*** Logon ***")
user_name = access.login()

while user_name != "AUTH_FAILURE":    
    user_role = "SuperUser" # TODO get this from Access-table in database
    user_language = settings.get_user_language(user_name)
    sp.call('cls', shell=True)
    # TODO  Add function to add user language dynamically using Google translate

    # print user and accesslevel
    print(translation.GetTranslatedText("USERNAME", user_language).strip() + user_name)
    print(translation.GetTranslatedText("ACCESSLEVEL", user_language).strip() + user_role)
    print(translation.GetTranslatedText("LANGUAGE", user_language).strip() + user_language)

    # print menu and read user choice  
    print(translation.GetTranslatedText("WELCOME", user_language).strip())  
    print(translation.GetTranslatedText("REGLOAN", user_language).strip())  
    print(translation.GetTranslatedText("RETURN", user_language).strip())    
    print(translation.GetTranslatedText("VIEWLOANS", user_language).strip())  

    # TODO Translate menu
    print("10. Vis lånere*")
    print("11. Ny låner*")    
    print("12. Slett låner*")
    print("13. Endre låner")

    print("20. Vis utstyr*")
    print("21. Nytt utstyr*")    
    print("22. Slett utstyr*")
    print("23. Endre utstyr")
    
    print("30. Statistikk")
    print("40. Auto test")
    print(" 0. Avslutt")        
    menu_selection = input("Valg:")

    # go to chosen function
    if menu_selection == "1" or menu_selection == "01":
        loan.insert()
    elif menu_selection == "2"or menu_selection == "02":
        loan.returned()
    elif menu_selection == "3"or menu_selection == "03":
        loan.get()        
    elif menu_selection == "10":
        person.get()   
        input("Trykk ENTER for å gå videre!")     
    elif menu_selection == "11":   # person insert
        new_identity_number = input("Skriv inn lånenummer: ")
        new_name = input("Skriv fullt navn: ")    
        new_mobile = input("Skriv inn mobilnummer: ")
        new_role = input("Skriv inn rolle: ")
        new_class = input("Skriv inn klasse: ")    
        person.insert(new_identity_number, new_name, new_mobile, new_role, new_class)
        person.get()
        input("Trykk ENTER for å gå videre!")
    elif menu_selection == "12":    # person delete
        print("Sletting av lånetaker.")    
        del_identity_number = input("Skriv inn lånenummer: ")
        person.delete(del_identity_number)
        person.get()    # get() should return an object? autotest trenger å telle ant. objekter og også søke i resultatsettet? eller bar get(identity_number) identy_number kan være en liste.
        print("Sjekk i listen over om lånenummer ble slettet.")
        input("Trykk ENTER for å gå videre!")
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
    elif menu_selection == "40":
        autotest.run()
    elif menu_selection == "0":
        break        
    else:
        print("*** Menyvalg finnes ikke...")
exit("Ha det...")