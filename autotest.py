import person

def run():
    person.get()
    input("inserting two person rows")
    person.insert("999","Serine", "123 45 678", "ELEV", "FAM")
    input("wait...")
    person.insert("888","Ivar", "123 45 678", "ELEV", "FAM")
    person.get()
    input("deleting [888]")
    person.delete("888")
    person.get()
    input("Test is done!")
