# ASSA Abloy Test

## Instructions

### Pre-requisites

1. Fork the repository.
2. Create an Android (Kotlin) or iOS (Swift) application in the forked repository.
3. Name the branch `feature/FRAMEWORK_FIRSTNAME-LASTNAME`, e.g. `feature/KOTLIN_SEBASTIAN-PERSSON`.

### Task

Implement a simple search and select history function according to the Figma link: ([FIGMA Design](https://www.figma.com/design/4FGFIDr1xZVpO1Fr3SFOx4/Untitled?node-id=0-1&m=dev&t=cxovaN2pAAI2RrWd-1)). Attempt to replicate the Figma file to the best possible extent. 

1. The search should use a public REST API of your choice. A suggestion could be: `https://api.openbrewerydb.org/breweries/search?page=1&per_page=5&query=` (where you need to pass the search query as a string). See the docs here: ([Brewery API Docs](https://www.openbrewerydb.org/documentation/)).
2. Search for anything.
3. Display partial search results (5) in a list beneath the search field, with an option to show all (maximum 10).
4. When making a selection, the search value should be saved with a date/timestamp beneath the search box, as a search history.
5. The page should be responsive, adapting to all devices for either Android or iOS (depending on your test).
6. The search history should be persisted in locally on the phone. So when the app is restarted it shall still be visible.
7. When you're done - push your branch to your *own Github* and and let us know when it's done with a pull request.

Extras:
* Add unit tests to prove that you're capable of doing so.

### What we will look at extra carefully

* Code quality
* Sanity checking
* Design patterns
* Component structuring
* Folder structuring
* Semantics, clean code and readability
* Unit tests

### Additional notes

* Solve the task as far as you think is necessary.
