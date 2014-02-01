Application has a few main actions that can provide you with some data.

There are two type of data presentation: json and api. Needed format could be retrieved
by adding to each url parameter called format, for example: http://127.0.0.1:8000/?format=json
First of all its an api root:
- http://127.0.0.1:8000/
It provides you with available view sets that can be accessed via specified url.
The next one is:
- http://127.0.0.1:8000/users/
This api action provides all users with its friends that are divided on pages by 10
elements. Lets check out the data that we have on this page:
 - count - the whole number of available users;
 - next - the url to get next 10 user records or null if current page is last;
 - previous - the url to get previous 10 user records or null if current page is first;
 - results - users data that holds id, firstname, surname, age, gender and the list 
of all user friends ids.

There are also three main social graph actions available in API:
http://127.0.0.1:8000/users/<user_id>/friends/<friends_type>/
 - user_id here is the id of user for which we want to get the friends list 
 - friends_type available in three modes: direct|friends|suggested

Examples:
 - http://127.0.0.1:8000/users/20/friends/direct/ - returns the list contains all 
direct friends ids for user with id = 20
 - http://127.0.0.1:8000/users/20/friends/friends/ - returns the list of dicts
where each contains direct friend id as key and the list of friends ids for current 
direct friend as value for user with id = 20
 - http://127.0.0.1:8000/users/20/friends/suggested/ - returns the list contains
all suggested friends ids for user with id = 20

All pages, except the root, need the authentication, according to api/sql/database.sql 
its admin:admin.