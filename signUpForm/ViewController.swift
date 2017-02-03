import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
    @IBOutlet weak var tf_first_name: UITextField!
    
    @IBOutlet weak var tf_last_name: UITextField!
    
    @IBOutlet weak var tf_email_id: UITextField!
    
    @IBOutlet weak var tf_password: UITextField!
    
    @IBOutlet weak var tf_confirm_password: UITextField!
    
    @IBOutlet weak var segment_gender: UISegmentedControl!
    
    @IBOutlet weak var tf_date_of_birth:UITextField!
    
    let date_picker = UIDatePicker()
    
    @IBOutlet weak var tf_about_me: UITextField!
    
    @IBOutlet weak var tf_phone_number: UITextField!

    @IBOutlet weak var btn_sign_up: UIButton!
    
    @IBOutlet var text_field: [UITextField]!
    
    var message1 = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        for textField in text_field{
            
            textField.layer.cornerRadius=8
            textField.layer.masksToBounds=true
            textField.layer.borderColor=UIColor.gray.cgColor
            textField.layer.borderWidth=1
            textField.setValue(UIColor.init(colorLiteralRed: 80/255, green: 80/255, blue: 80/255, alpha: 1.0), forKeyPath: "_placeholderLabel.textColor")
            
        }
        
        self.btn_sign_up.layer.cornerRadius=8
        self.btn_sign_up.layer.masksToBounds=true
        self.btn_sign_up.layer.borderColor=UIColor.gray.cgColor
        self.btn_sign_up.layer.borderWidth=1
        
        tf_first_name.delegate = self
        tf_last_name.delegate = self
        tf_email_id.delegate = self
        tf_password.delegate = self
        tf_confirm_password.delegate = self
        tf_date_of_birth.delegate = self
        tf_about_me.delegate = self
        tf_phone_number.delegate = self
        
        create_date_picker()
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        btn_sign_up.isEnabled = true
        animateViewMoving(up: true, moveValue: 100)
       
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(up: false, moveValue: 100)
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
        UIView.commitAnimations()
    }

    func create_date_picker(){
        date_picker.datePickerMode = .date
        let tool_bar = UIToolbar()
        tool_bar.sizeToFit()
        let done_button = UIBarButtonItem(barButtonSystemItem:.done, target: nil, action: #selector(done_pressed))
        tool_bar.setItems([done_button], animated: false)
        tf_date_of_birth.inputAccessoryView = tool_bar
        tf_date_of_birth.inputView = date_picker
    }
    
    func done_pressed(){
        let date_formatter = DateFormatter()
        date_formatter.dateStyle = .short
        date_formatter.timeStyle = .none
        tf_date_of_birth.text = date_formatter.string(from: date_picker.date)
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func isValidAlphabet(testStr: String) -> Bool {
        
        let alphabetRegEx = "^[a-zA-Z]+$"
        let alphabetTest = NSPredicate(format:"SELF MATCHES %@", alphabetRegEx)
        return alphabetTest.evaluate(with: testStr)
    }
    
    func isAlphabetLength(alphabet: String) -> Bool {
        if alphabet.characters.count <= 10{
            return true
        }
        else{
            return false
        }
    }
    
    func isValidEmail(testStr: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isPasswordSame(password: String , confirmPassword : String) -> Bool {
        if password == confirmPassword{
            return true
        }
        else{
            return false
        }
    }
    
    func isPwdLength(password: String , confirmPassword : String) -> Bool {
        if password.characters.count <= 15 && confirmPassword.characters.count <= 15{
            return true
        }
        else{
            return false
        }
    }
    
    func isValidAboutMe(testStr: String) -> Bool {
        let aboutMeRegEx = "[a-zA-Z][a-zA-Z ]+[a-zA-Z]$"
        let aboutMeTest = NSPredicate(format:"SELF MATCHES %@", aboutMeRegEx)
        return aboutMeTest.evaluate(with: testStr)
    }

    func isAboutMeLength(about_me: String) -> Bool {
        if about_me.characters.count <= 50{
            return true
        }
        else{
            return false
        }
    }
    
    func isValidPhoneNumber(value: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    
    func isPhoneNumberLength(phone_number: String) -> Bool {
        if phone_number.characters.count == 13{
            return true
        }
        else{
            return false
        }
    }
    
    func alertControllerr(_message: String){
        
        let  myAlertNameFailure = UIAlertController(title : "Alert" , message : message1 , preferredStyle :UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title : "OK" , style : UIAlertActionStyle.default , handler:nil)
        
        myAlertNameFailure.addAction(okAction)
        self.present(myAlertNameFailure , animated : true , completion : nil)
        
    }
    @IBAction func btn_sign_up_action(_ sender: Any) {
        
        if tf_first_name.text == "" {
                    
            message1 = "First Name Required"
            alertControllerr(_message: message1)
            btn_sign_up.isEnabled = false
        }
        
        else if tf_last_name.text == "" {
            message1 =  "Last Name Required"
            alertControllerr(_message: message1)
            btn_sign_up.isEnabled = false
        }
            
        else if tf_email_id.text == "" {
            message1 =  "Email Required"
            alertControllerr(_message: message1)
            btn_sign_up.isEnabled = false
        }
          
        else if tf_password.text == "" {
            message1 =  "Password Required"
            alertControllerr(_message: message1)
            btn_sign_up.isEnabled = false
        }
          
        else if tf_confirm_password.text == "" {
            message1 =  "Re-enter Password"
            alertControllerr(_message: message1)
            btn_sign_up.isEnabled = false
        }
            
        else if tf_date_of_birth.text == "" {
            message1 =  "Date_of_Birth Required"
            alertControllerr(_message: message1)
            btn_sign_up.isEnabled = false
        }
            
        else if tf_about_me.text == "" {
            message1 =  "About me"
            alertControllerr(_message: message1)
            btn_sign_up.isEnabled = false
        }
            
            
        else if tf_phone_number.text == "" {
            message1 =  "Phone number"
            alertControllerr(_message: message1)
            btn_sign_up.isEnabled = false
        }
         
        else{
            if isValidAlphabet(testStr: tf_first_name.text ?? "") && isAlphabetLength(alphabet: tf_first_name.text ?? "") && isValidAlphabet(testStr: tf_last_name.text ?? "") && isAlphabetLength(alphabet: tf_last_name.text ?? "") && isValidEmail(testStr: tf_email_id.text ?? "") && isPwdLength(password: tf_password.text ?? "", confirmPassword: tf_confirm_password.text ?? "") && isPasswordSame(password: tf_password.text ?? "", confirmPassword: tf_confirm_password.text ?? "") && isValidAboutMe(testStr: tf_about_me.text ?? "") && isAboutMeLength(about_me: tf_about_me.text ?? "") &&  isValidPhoneNumber(value: tf_phone_number.text ?? "") && isPhoneNumberLength(phone_number: tf_phone_number.text ?? "")
                    {
                    
                btn_sign_up.isEnabled = true
                        message1 =  "Sign Up Success"
                        alertControllerr(_message: message1)
                        btn_sign_up.isEnabled = false
                }
                
                
            else if(!isValidAlphabet(testStr: tf_first_name.text ?? "")) {
                    message1 =  "Provide valid first name"
                    alertControllerr(_message: message1)
                    btn_sign_up.isEnabled = false
            }
                
            
            else if(!isAlphabetLength(alphabet: tf_first_name.text ?? "")){
                
                message1 =  "Length of first name can't be greater than 10"
                alertControllerr(_message: message1)
                btn_sign_up.isEnabled = false            }
                
            
            else if !isValidAlphabet(testStr: tf_last_name.text ?? ""){
                
                message1 =  "Provide valid last name"
                alertControllerr(_message: message1)
                btn_sign_up.isEnabled = false
            }
               
                
            else if !isAlphabetLength(alphabet: tf_last_name.text ?? ""){
                
                message1 =  "Length of last name can't be greater than 10"
                alertControllerr(_message: message1)
                btn_sign_up.isEnabled = false
            }
                
            
            else if !isValidEmail(testStr: tf_email_id.text ?? ""){
                
                message1 =  "Provide valid email"
                alertControllerr(_message: message1)
                btn_sign_up.isEnabled = false
            }
                
                
            else if !isPwdLength(password: tf_password.text ?? "", confirmPassword: tf_confirm_password.text ?? "") {
                
                message1 =  "Password can't be greater than zero"
                alertControllerr(_message: message1)
                btn_sign_up.isEnabled = false
            }
                
            else if !isPasswordSame(password: tf_password.text ?? "", confirmPassword: tf_confirm_password.text ?? "") {
                
                message1 =  "Password is not same"
                alertControllerr(_message: message1)
                btn_sign_up.isEnabled = false
            }
                
            else if !isValidAboutMe(testStr: tf_about_me.text ?? "") && isAboutMeLength(about_me: tf_about_me.text ?? ""){
                
                message1 =  "Provide valid details about yourself"
                alertControllerr(_message: message1)
                btn_sign_up.isEnabled = false
            }
             
            else if !isAboutMeLength(about_me: tf_about_me.text ?? ""){
                
                message1 =  "About me length can't be greater than zero"
                alertControllerr(_message: message1)
                btn_sign_up.isEnabled = false
            }
               
            else if !isValidPhoneNumber(value: tf_phone_number.text ?? ""){
                
                message1 =  "Provide valid phone number"
                alertControllerr(_message: message1)
                btn_sign_up.isEnabled = false
            }
            
            else if !isPhoneNumberLength(phone_number: tf_phone_number.text ?? ""){
                message1 =  "Phone number length should be equal to 10"
                alertControllerr(_message: message1)
                btn_sign_up.isEnabled = false
            }
                
            else{
                btn_sign_up.isEnabled = false
                        
                message1 =  "Sign Up failed"
                alertControllerr(_message: message1)
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
