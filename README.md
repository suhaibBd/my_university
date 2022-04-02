# my_university

 # main file
 - initialize the sizer and blocProvider (multi Bloc Provider) => able to expanded
 # home_screen file
 - launch home screen as a child of multiBlocProvider
 - when JordanUniversities build method running or called the bloc should retrieve data from api  
 - data fetched will displayed as a ListView every item inside it as a card  
 - the card contain ListTile that contain first character from university name as CircleAvatar 
   with backGround color that set randomly and contain university name and domains
 - in the top of screen we found custom textField that allow us to search using name of university or domain
 # webView (webview_flutter) package
 - if you click on card the web page url will send to web_pages screen and running as a webView
 # Bloc
 - when JordanUniversities build method runs or is called, the bloc should retrieve data from api
   fetched data will be displayed as a ListView, each item inside it as a card
 - university_bloc directory contains (Event,States,Repo,and bloc)




