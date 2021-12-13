# **[Best way to dismiss Keyboard in a View Controller iOS (Swift)](https://kaushalelsewhere.medium.com/how-to-dismiss-keyboard-in-a-view-controller-of-ios-3b1bfe973ad1)**

<img width="343" alt="iPhone_12" src="https://user-images.githubusercontent.com/47273077/145735938-08450608-86fa-420f-b304-50c429c18438.png">

## First way: Implement UITextFieldDelegate’s textFieldShouldReturn method and dismiss current keyboard.

```swift
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var text1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text1.delegate = self

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        text1.resignFirstResponder()
        
        return true
    }
}
```
