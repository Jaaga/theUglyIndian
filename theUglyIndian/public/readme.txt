This app has a web client and an android client. The backend is being developed in ruby on rails.

The following description is the rough flow of the web client.

You can see the android app flow here- https://popapp.in/projects/542c3ae76b208e6469aed461/preview 

1. A user visits the site(starting with index.html), he can login to app using google oauth.
2. After login he will reach his dashboard, in navigation bar of the dashboard there are options to 
     a) Initiate a Spotfix - Clicking this will take you to page where you can initiate a spotfix by giving details like location, description and uploding images etc. After initiating the spotfix it will be sent to admin for an approval, if admin approves then it will start featuring in the "Upcomin Spotfixes" section.

     b) Upcoming Spotfixes - takes you to a page which lists all upcoming spotfixes. Clicking on any upcoming Spotfixes will take you to the individual spotfix description page. You can see the details and join them. You can also search for a spotfix.

     c) My Spotfixes- these are spotfixes that you initiated. There are spotfixes that are done in past and then spotfixes that you have initiated and are Upcoming. clicking on indiviual spotfixes will take you to their pages and will give you option to edit the spotfix. 

     d) logout -Would do the most obvious thing! :)

  Thing on dashboard page are metrics and upcoming spotfixes. metrics are how many spotfixes done. How many hours spent etc.


3. Admin view-
	Visit admin.html (granted that you are set as admin)
	You will see a section of spotfixes waiting approval. you can visit their individual pages and then approve them.
	other sections are Upcoming and past spotfixes.

