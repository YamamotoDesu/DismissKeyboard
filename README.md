# **[Best way to dismiss Keyboard in a View Controller iOS (Swift)](https://kaushalelsewhere.medium.com/how-to-dismiss-keyboard-in-a-view-controller-of-ios-3b1bfe973ad1)**

## First way: Implement UITextFieldDelegate’s textFieldShouldReturn method and dismiss current keyboard.
This solution seems good enough but not all keyboards have return button.

<img width="343" alt="iPhone_12" src="https://user-images.githubusercontent.com/47273077/145735938-08450608-86fa-420f-b304-50c429c18438.png">

```swift
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text1.delegate = self
        text2.delegate = self

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        text1.resignFirstResponder()
        
        return true
    }
}
```


## Second way: when textfield has no return keys eg. (UIKeyboardType.numberPad) 
<img width="350" alt="iPhone_12" src="https://user-images.githubusercontent.com/47273077/145736192-94996fee-a7a1-4286-97be-c859d6f6eaa4.png">

```swift
class ViewController: UIViewController {
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextFields()
        
    }
    
    func setupTextFields() {
        let toolbar = UIToolbar()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                        target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                         target: self, action: #selector(doneButtonTapped))
        
        toolbar.setItems([flexSpace, doneButton], animated: true)
        toolbar.sizeToFit()
        
        text1.inputAccessoryView = toolbar
        text2.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTapped() {
        view.endEditing(true)
    }
}
```
<img width="358" alt="iPhone_12" src="https://user-images.githubusercontent.com/47273077/145736591-223d5147-79df-42e8-a58b-bdfa840d5baf.png">


## Third: what could be better than tapping anywhere on the view controller to dismiss the keyboard.
Just one line of code would serve our purpose. Add a tap gesture recogniser on self.view, set target as self.view and set selector as endEditing: (in ViewDidLoad() or anywhere you like)

```swift
class ViewController: UIViewController {
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
```

<img width="358" alt="iPhone_12" src="https://github.com/YamamotoDesu/DismissKeyboard/blob/main/DismissKeyboard/tapgesture.gif">



## Caveat*: there could be issues if you are dealing with tableviews and adding this tap gesture, selecting the rows, didSelectRowAtIndex path could not be fired until pressed long.

<img width="358" alt="iPhone_12" src="https://github.com/YamamotoDesu/DismissKeyboard/blob/main/DismissKeyboard/longPress.gif">

### Solution for that is to modify above code as below.
```swift
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
```

## Fourth: If your textfields are added on UIScrollview or any subview of it eg. UITableView, you can use set `keyboard dismiss mode` like below. 

```swift 

        tableView.keyboardDismissMode = .onDrag // or .interactive
```
<img width="358" alt="iPhone_12" src="https://github.com/YamamotoDesu/DismissKeyboard/blob/main/DismissKeyboard/dismissMode.gif">

