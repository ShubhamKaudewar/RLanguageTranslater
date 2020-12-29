library(reticulate)
source_python("pyfn.py")
translator <- Translator()

language <- list("bn=Bangla",
                 "en=English",
                 "ko=Koren",
                 "fr=French",
                 "de=German",
                 "he=Hebrew",
                 "hi=Hindi",
                 "it=Italian",
                 "ja=Japanese",
                 "ls=Latin",
                 "ms=Malay",
                 "ne=Nepali",
                 "ru=Russian",
                 "ar=Arabic",
                 "zh=Chinese",
                 "es=Spanish")

allow <- TRUE
selected_language <- ''
while (allow)
  user_code=readline(prompt="Enter 'options':")
  print('user_Code')
  if (user_code == "options"){
    print("Code: language")
    keys<-key()
    values<-value()
    for (each in language)
      print(each.split('=')[0],each.split('=')[1])
      keys <- key(keys, each.split('=')[0])
      values <- values(values, each.split('=')[1])
  } else {
    for (i in 0:length(keys))
      if (keys[i] == user_code)
        print("You have selected",values[i])
        selected_language<-values[i]
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
print("Translated from :",selected_language)

