//
//  ViewController.swift
//  signUpForm
//
//  Created by Sierra 4 on 31/01/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

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
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.tf_first_name.layer.cornerRadius=8
        self.tf_first_name.layer.masksToBounds=true
        self.tf_first_name.layer.borderColor=UIColor.gray.cgColor
        self.tf_first_name.layer.borderWidth=1
        tf_first_name.setValue(UIColor.init(colorLiteralRed: 80/255, green: 80/255, blue: 80/255, alpha: 1.0), forKeyPath: "_placeholderLabel.textColor")
        
        self.tf_last_name.layer.cornerRadius=8
        self.tf_last_name.layer.masksToBounds=true
        self.tf_last_name.layer.borderColor=UIColor.gray.cgColor
        self.tf_last_name.layer.borderWidth=1
        tf_last_name.setValue(UIColor.init(colorLiteralRed: 80/255, green: 80/255, blue: 80/255, alpha: 1.0), forKeyPath: "_placeholderLabel.textColor")
        
        self.tf_email_id.layer.cornerRadius=8
        self.tf_email_id.layer.masksToBounds=true
        self.tf_email_id.layer.borderColor=UIColor.gray.cgColor
        self.tf_email_id.layer.borderWidth=1
        tf_email_id.setValue(UIColor.init(colorLiteralRed: 80/255, green: 80/255, blue: 80/255, alpha: 1.0), forKeyPath: "_placeholderLabel.textColor")
        
        self.tf_password.layer.cornerRadius=8
        self.tf_password.layer.masksToBounds=true
        self.tf_password.layer.borderColor=UIColor.gray.cgColor
        self.tf_password.layer.borderWidth=1
        tf_password.setValue(UIColor.init(colorLiteralRed: 80/255, green: 80/255, blue: 80/255, alpha: 1.0), forKeyPath: "_placeholderLabel.textColor")
        
        self.tf_confirm_password.layer.cornerRadius=8
        self.tf_confirm_password.layer.masksToBounds=true
        self.tf_confirm_password.layer.borderColor=UIColor.gray.cgColor
        self.tf_confirm_password.layer.borderWidth=1
        tf_confirm_password.setValue(UIColor.init(colorLiteralRed: 80/255, green: 80/255, blue: 80/255, alpha: 1.0), forKeyPath: "_placeholderLabel.textColor")
        
        self.segment_gender.layer.cornerRadius=8
        self.segment_gender.layer.masksToBounds=true
        self.segment_gender.layer.borderColor=UIColor.gray.cgColor
        self.segment_gender.layer.borderWidth=1
        
        
        self.tf_date_of_birth.layer.cornerRadius=8
        self.tf_date_of_birth.layer.masksToBounds=true
        self.tf_date_of_birth.layer.borderColor=UIColor.gray.cgColor
        self.tf_date_of_birth.layer.borderWidth=1
        tf_date_of_birth.setValue(UIColor.init(colorLiteralRed: 80/255, green: 80/255, blue: 80/255, alpha: 1.0), forKeyPath: "_placeholderLabel.textColor")
        
        self.tf_about_me.layer.cornerRadius=8
        self.tf_about_me.layer.masksToBounds=true
        self.tf_about_me.layer.borderColor=UIColor.gray.cgColor
        self.tf_about_me.layer.borderWidth=1
        tf_about_me.setValue(UIColor.init(colorLiteralRed: 80/255, green: 80/255, blue: 80/255, alpha: 1.0), forKeyPath: "_placeholderLabel.textColor")
        
        
        self.tf_phone_number.layer.cornerRadius=8
        self.tf_phone_number.layer.masksToBounds=true
        self.tf_phone_number.layer.borderColor=UIColor.gray.cgColor
        self.tf_phone_number.layer.borderWidth=1
        tf_phone_number.setValue(UIColor.init(colorLiteralRed: 80/255, green: 80/255, blue: 80/255, alpha: 1.0), forKeyPath: "_placeholderLabel.textColor")
        
        
        
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
        
        
        
        //tf_first_name.addTarget(self, action: Selector("textFieldDidChange:"), for: UIControlEvents.editingChanged)

        /*textFieldDidChange(textField: tf_first_name)
        textFieldDidChange(textField: tf_last_name)
        textFieldDidChange(textField: tf_email_id)
        textFieldDidChange(textField: tf_password)
        textFieldDidChange(textField: tf_confirm_password)
        textFieldDidChange(textField: tf_date_of_birth)
        textFieldDidChange(textField: tf_about_me)
        textFieldDidChange(textField: tf_phone_number)*/
        
        
        //textFieldDidChange()
        
        //NotificationCenter.default.addObserver(self, selector: Selector(("keyboardWillShow:")), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        //NotificationCenter.default.addObserver(self, selector: Selector(("keyboardWillHide:")), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
        
        //NotificationCenter.default.addObserver(self, selector: Selector(("keyboardWillShow:")), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        //NotificationCenter.default.addObserver(self, selector: Selector(("keyboardWillHide:")), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        
    }
    /*
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
    */
    
   
    /*func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }*/
    
    
    
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
        textField.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    /*var is_email:Bool{
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    var isValidPassword: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z_0-9\\-_,;.:#+*?=!§$%&/()@]+$", options: .caseInsensitive)
            if(regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil){
                
                if(self.characters.count>=6 && self.characters.count<=20){
                    return true
                }else{
                    return false
                }
            }else{
                return false
            }
        } catch {
            return false
        }
    }*/
    
    
    
       /*name2.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
    name3.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
    name4.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)*/
    
    
    //func textFieldDidChange(textField: UITextField) {
        //    }
 

    @IBAction func btn_sign_up_action(_ sender: Any) {
        
       /* if tf_first_name.text == "" || tf_last_name.text == "" || tf_email_id.text == "" || tf_password.text == "" || tf_confirm_password.text == "" || tf_date_of_birth.text == "" || tf_about_me.text == "" || tf_phone_number.text == "" {
            //textField.text = "input required"
            btn_sign_up.isEnabled = false
        } else {
            btn_sign_up.isEnabled = true
        }*/
        /*
        for text in self.text_field {
            if text = "" {
            
            }
        
        }*/
        
        for view in self.view.subviews as [UIView] {
            if let text_fieldd = view as? UITextField {
                if text_fieldd.text == "" {
                    
                    let alertController = UIAlertController(title: "Input required", message: "Provide input",preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default)
                    {
                        (action:UIAlertAction!) in
                        print("you have pressed OK button");
                    }
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true, completion:nil)
                    
                    
                    text_fieldd.text = "input required"
                    btn_sign_up.isEnabled = false
                }
                else{
                    btn_sign_up.isEnabled = true
                    
                    let alertController = UIAlertController(title: "Sign up success", message: "You are signed up", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default)
                    {
                        (action:UIAlertAction!) in
                        print("you have pressed OK button");
                    }
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true, completion:nil)
                    
                            //btn_sign_up(alertController, animated: true, completion:nil)
                    }
            }
        }

        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

