def get_user_language(user_name):
    # TODO Create settings-table in database instead
    if user_name == "rune":
        return "EN"
    elif user_name == "ivar":
        return "GE"
    else:
        return "NO"