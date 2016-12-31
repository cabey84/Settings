# Settings-
project designed to demonstrate custom table view cells, delegates creating protocols, and implementing MVC patterns


1. Delegate Pattern in the Custom Cell/View Controller 
    1. TableViewCell File
        a. subclass custom UITableViewCell
        b. create delegate pattern (bc views should not interact with model) 
            i.   step 1- create a protocol outside the class, so table view cell is the delegatOR 
            ii.  step 2- create a property weak reference delegate variable 
            iii. step 3- also create an IB action whenever the value is switched on or off, which will then go to delegate and 
                 look for classes which conform to the delegate- in this case the view controller. 
    2. ViewController
       a. step 1- make it conform to the delegate protocol 
       b. step 2- implement the body of the delegate function that updates the setting object and pass in the cell as the 
          parameter as well as selected variable Bool 
       c. **step 3- set the delegate as self 
          i.e. cell?.delegate = self in cellForRow function
          

2. UpdateWith - Create an update with functions in TableViewCell file 
   1. create an optional variable of the model to be passed in to the update function 
   2. Create an updateWithCell function on your custom cell class used to set properties on cells. Include in the    
      updateWithCell function a change in cell background color based on the setting's isSet property (that way you can tell 
      what the model is storing for isSet even after tapping the switch).
   3. This function will later be called in the ViewController's cellForRow function. 
