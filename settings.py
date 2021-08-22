def get_user_language(user_name):
    # TODO Create settings-table in database instead
    if user_name == "rune":
        return "GE"
    elif user_name == "ivar":
        return "FI"
    else:
        return "NO"