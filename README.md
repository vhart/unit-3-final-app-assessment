#Unit 3 Final App Assessment

This part of the assessment contains 5 screens

**Screen 1**  
This screen contains two buttons, one visible and one hidden. 
*Requirements*
* Conform to the protocol created in screen 2 and implement all required methods. 
* Segue to screen 3 (via the hidden button)

**Screen 2**  
This screen contains three buttons: red, green, and blue.

*Requirements*
* Set constraints in the storyboard so that each button takes up equal space within the view (should work landscape)
* Implement a custom protocol (delegate). This protocol will have a single method for sending a single `UIColor` from screen 2 to its delegate.
  Whenever the user selects a color button, the view controller will send the color (either `[UIColor redColor]`, `[UIColor greenColor]`, 
  or `[UIColor blueColor]`) to its delegate as a parameter. In this situation, the delegate will be screen 1.

  ** When the delegate (screen 1) receives a color, it should set its view's background color. When the correct color is selected the 
  hidden button will appear **

**Screen 3**  
This screen is nothing more than a `UITableViewController`. 

*Requirements*
* Populate the table with random cat facts. The API information is set for you at the top of `C4QCatFactsTableViewController.m`. 
* Create a custom `UITableViewCell` with a + button on the right side (asset is already in the project).
* Save a cat fact in `NSUserDefaults` when the + button is tapped.
* The height of the cell should be variable based on the amount of text provided.

*Bonus*
* Present an alert whenever you save a cat fact
* Change the + button to a checkmark indicating that a fact is already saved

**Screen 4**   
This is a very basic `UITableViewController`. Nothing more.

*Requirements*
* Display the saved cat facts.

**Screen 5**  
This is a detail view for your cat facts. Tapping on a cell in screen 3 will segue to this screen.

*Requirements*
* Display a random cat photo in full screen in the background (API information is in `C4QCatFactsDetailViewController.m`).
* Display the text that corresponds with the cell tapped. 
* The text must be centered vertically and have 40pts space on the left and right.
* The background image should have a content mode of aspect fill and SHOULD NOT overflow the view (when you 
  go back to the previous screen you shouldn't see part of the image)

*Bonus*
* Load the cat image on a background thread so that it doesn't freeze the UI
* If the image isn't downloaded by the time you hit the back button, cancel the download task. 

**Bonus**

* Remove saved cat facts  
* Don't save duplicate cat facts  
* Change the "add_icon" to a "checkmark_icon" if the article is already saved  

<img src="https://github.com/accesscode-2-2/unit-3-final-app-assessment/blob/master/images/one.png" width="220" />
<img src="https://github.com/accesscode-2-2/unit-3-final-app-assessment/blob/master/images/two.png" width="220" />
<img src="https://github.com/accesscode-2-2/unit-3-final-app-assessment/blob/master/images/three.png" width="360" />
<img src="https://github.com/accesscode-2-2/unit-3-final-app-assessment/blob/master/images/four.png" width="220" />
<img src="https://github.com/accesscode-2-2/unit-3-final-app-assessment/blob/master/images/five.png" width="220" />
<img src="https://github.com/accesscode-2-2/unit-3-final-app-assessment/blob/master/images/six.png" width="220" />
<img src="https://github.com/accesscode-2-2/unit-3-final-app-assessment/blob/master/images/seven.png" width="220" />
<img src="https://github.com/accesscode-2-2/unit-3-final-app-assessment/blob/master/images/eight.png" width="220" />
<img src="https://github.com/accesscode-2-2/unit-3-final-app-assessment/blob/master/images/nine.png" width="220" />

<img src="https://github.com/accesscode-2-2/unit-3-final-app-assessment/blob/master/images/app.gif" width="320" />
