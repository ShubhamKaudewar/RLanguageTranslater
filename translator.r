library(reticulate)
source_python("pyfn.py")
translator <- Translator()

language <- list("bn"="Bangla",
          "bn"="Bangla",
          "en"="English",
          "ko"="Koren",
          "fr"="French",
          "de"="German",
          "he"="Hebrew",
          "hi"="Hindi",
          "it"="Italian",
          "ja"="Japanese",
          "ls"="Latin",
          "ms"="Malay",
          "ne"="Nepali",
          "ru"="Russian",
          "ar"="Arabic",
          "zh"="Chinese",
          "es"="Spanish")

allow <- TRUE

while (allow)
    user_code=readline(prompt="Enter 'options':")
    if (user_code == "options"){
        print("Code: language")
        for (each in language)
            print(each[key],each[value])
        } else {
        for (lan_code in language.keys())
            if (lan_code == user_code)
                print("You have selected {language[lan_code]}")
                allow <- FALSE
        if (allow)
            print("It's not a valid language code!")
        }
while (TRUE)
    string=readline(prompt = "\nWrite the text you want to translate: \nTo exit the program write 'close'\n")
    if (string == "close")
        print("\nHave a nice Day!")
        break

    translated = translator.translate(string, dest=user_code)

    print("\n{language[user_code]} translation: {translated.text}")
    print("Pronunciation : {translated.pronunciation}")

    for (i in language.items())
        if (translated.src == i[0])
            print("Translated from : {i[1]}")

    