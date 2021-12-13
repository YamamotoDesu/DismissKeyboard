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
