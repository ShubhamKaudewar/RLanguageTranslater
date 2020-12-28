library(reticulate)
py_install("googletrans")
translator <- Translator()

library(hash)
language <- hash()

language[["bn"]] <- "Bangla"
language[["en"]] <- "English"
language[["ko"]] <- "Koren"
language[["fr"]] <- "French"
language[["de"]] <- "German"
language[["he"]] <- "Hebrew"
language[["hi"]] <- "Hindi"
language[["it"]] <- "Italian"
language[["ja"]] <- "Japanese"
language[["ls"]] <- "Latin"
language[["ms"]] <- "Malay"
language[["ne"]] <- "Nepali"
language[["ru"]] <- "Russian"
language[["ar"]] <- "Arabic"
language[["zh"]] <- "Chinese"
language[["es"]] <- "Spanish"

allow <- True

while (allow)
    user_code <- readline(prompt = "enter 'options' \n");
    if (user_code == "options"){
        print("Code : Language")
        for (i in language.items())
            print("{i[0]} => {i[1]}")
        print()
        } else {
        for (lan_code in language.keys())
            if (lan_code == user_code)
                print("You have selected {language[lan_code]}")
                allow <- False
        if (allow)
            print("It's not a valid language code!")
        }
while (True)
    string <- input("\nWrite the text you want to translate: \nTo exit the program write 'close'\n")
    if (string == "close")
        print("\nHave a nice Day!")
        break

    translated = translator.translate(string, dest=user_code)

    print("\n{language[user_code]} translation: {translated.text}")
    print("Pronunciation : {translated.pronunciation}")

    for (i in language.items())
        if (translated.src == i[0])
            print("Translated from : {i[1]}")
