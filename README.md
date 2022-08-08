# flutter-sqlite-note-app
A simple note taking app built with Flutter.

In an attempt to learn more about Flutter and database integration, I created this simple note taking app.

Some Flutter concepts covered in the project:
- Basic Material App UI with AppBar and body.
- Navigation with MaterialPageRoute.
- Listview.builder with FutureBuilder.

A note is represented as a card, and placed in a Listview of cards. Each note contains a title, date of creation, and a checkbox to track completion. Users can create a new note by interacting with a floating action button on the homepage, which navigates to the note creation page where they can enter the note title. Default status is incomplete, and the date of creation is recorded as the DateTime.now(). On the homescreen, tapping on a note opens up their info, showing the title on the app bar, and in the body the creation date followed by the completion status. A slidable widget is in used to delete a note from the database.

The app is structured into 3 folders: models to keep the database and note model; widgets to keep track of functionalities; and screens to manage different screens upon usage. It bears a MVC structure, still, a bit spaghetti 🍝.

No CRUD as of now, maybe forever, since the code is already so much of a mess that implemeting an update feature now is practically impossible (at least for myself), and that would be taken care of in the next project. 😜

So far so good for the first project. I love Flutter already ❤️ 
