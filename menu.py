import person
import equipment
import loan
import autotest
import translation
import settings
import subprocess as sp
import access_object
sp.call('cls', shell=True)

# login
user1 = access_object.User()    # user obejct to hold user info
user1.login()

while user1.user_auth == "OK":  
    sp.call('cls', shell=True)  

    # print user info
    print(translation.GetTranslatedText("USERAUTH", user1.user_language).strip() + user1.user_auth)
    print(translation.GetTranslatedText("USERNAME", user1.user_language).strip() + user1.user_name)
    print(translation.GetTranslatedText("ACCESSLEVEL", user1.user_language).strip() + user1.user_role)    
    print(translation.GetTranslatedText("LANGUAGE", user1.user_language).strip() + user1.user_language)
    
    # print menu and read user choice  
    print(translation.GetTranslatedText("WELCOME", user1.user_language).strip())  
    print(translation.GetTranslatedText("REGLOAN", user1.user_language).strip())  
    print(translation.GetTranslatedText("RETURN", user1.user_language).strip())    
    print(translation.GetTranslatedText("VIEWLOANS", user1.user_language).strip())  

    # TODO Translate menu
    print("10. Vis lånere*")
    print("11. Ny låner*")    
    print("12. Slett låner*")
    print("13. Endre låner")

    print("20. Vis utstyr*")
    print("21. Nytt utstyr*")    
    print("22. Slett utstyr*")
    print("23. Endre utstyr")
    
    print("30. Statistikk") # 30.
    print("31. Endre passord")  # 31.
    print("33. Endre språk") # 33
    print(translation.GetTranslatedText("AUTOTRANSMENUS", user1.user_language).strip())  # 35.
    print("40. Auto test")
    print(" 0. Avslutt")        
    menu_selection = input("Valg:")

    # perform chosen menu item
    if menu_selection == "1" or menu_selection == "01":
        loan.insert()
    elif menu_selection == "2"or menu_selection == "02":
        loan.returned()
    elif menu_selection == "3"or menu_selection == "03":
        loan.get()        
    elif menu_selection == "10":
        person.get()   
        input(translation.GetTranslatedText("PRESSENTER", user1.user_language).strip())             
    elif menu_selection == "11":   # person insert
        new_identity_number = input("Skriv inn lånenummer: ")
        new_name = input("Skriv fullt navn: ")    
        new_mobile = input("Skriv inn mobilnummer: ")
        new_role = input("Skriv inn rolle: ")
        new_class = input("Skriv inn klasse: ")    
        person.insert(new_identity_number, new_name, new_mobile, new_role, new_class)
        person.get()
        input(translation.GetTranslatedText("PRESSENTER", user1.user_language).strip()) 
    elif menu_selection == "12":    # person delete
        print("Sletting av lånetaker.")    
        del_identity_number = input("Skriv inn lånenummer: ")
        person.delete(del_identity_number)
        person.get()    # TODO get() should return an object? autotest trenger å telle ant. objekter og også søke i resultatsettet? eller bare get(identity_number) identy_number kan være en liste.
        print("Sjekk i listen over om lånenummer ble slettet.")
        input(translation.GetTranslatedText("PRESSENTER", user1.user_language).strip())        
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
    elif menu_selection == "31":
        user1.reset_password()
    elif menu_selection == "33":
        new_language = input("Select user langauge: ") 
        access_object.set_user_language(new_language, user1.user_name)
        user1.login()   # TODO refresh language instead
    elif menu_selection == "35":
        translation.update_translations()
        input(translation.GetTranslatedText("PRESSENTER", user1.user_language).strip()) 
    elif menu_selection == "40":
        autotest.run()
    elif menu_selection == "0":
        break        
    else:
        print("*** Menyvalg finnes ikke...")
exit("Exiting...")