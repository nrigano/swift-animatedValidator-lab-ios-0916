//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//
//uitextfielddidendediting delegates, protocols .de;egate = self must be called when using protocls in code






import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    var checksPassed = 0
    
    
    @IBAction func emailEntry(_ sender: AnyObject) {
        if ((emailTextField.text)?.characters.contains("@"))! && ((emailTextField.text)?.characters.contains("."))! {
            emailTextField.backgroundColor = UIColor.yellow
        } else if emailTextField.backgroundColor == UIColor.yellow && emailConfirmationTextField.backgroundColor == UIColor.green {
            emailTextField.backgroundColor = UIColor.green
        } else {
            emailTextField.backgroundColor = UIColor.red
        }
    }
    
    
    @IBAction func emailConfirmation(_ sender: AnyObject) {
        if emailConfirmationTextField.text == emailTextField.text && emailConfirmationTextField.text == emailTextField.text {
            emailConfirmationTextField.backgroundColor = UIColor.green
            emailTextField.backgroundColor = UIColor.green
            emailTextField.isEnabled = false
            emailConfirmationTextField.isEnabled = false
            checksPassed += 1
            emailConfirmationTextField.alpha = 0.5
            emailTextField.alpha = 0.5
 //           UIView.animate(withDuration: 2, animations: <#T##() -> Void#>)
            
        }
        else {
            emailConfirmationTextField.backgroundColor = UIColor.red
        }
    }
    @IBAction func phoneEntry(_ sender: AnyObject) {
        if (phoneTextField.text?.characters.count)! >= 7 && (phoneTextField.text?.isNumeric)!  {
            phoneTextField.backgroundColor = UIColor.green
            phoneTextField.isEnabled = false
            checksPassed += 1
            phoneTextField.alpha = 0.5
        } else {
            phoneTextField.backgroundColor = UIColor.red
        }
    }
    @IBAction func passwordEntry(_ sender: AnyObject) {
        if (passwordTextField.text?.characters.count)! >= 6 {
            passwordTextField.backgroundColor = UIColor.yellow
        }  else {
            passwordTextField.backgroundColor = UIColor.red
        }
    }
    @IBAction func passwordConfirm(_ sender: AnyObject) {
        if passwordConfirmTextField.text == passwordTextField.text {
            passwordConfirmTextField.backgroundColor = UIColor.green
            passwordTextField.backgroundColor = UIColor.green
            passwordTextField.isEnabled = false
            passwordConfirmTextField.isEnabled = false
            checksPassed += 1
            passwordTextField.alpha = 0.5
            passwordConfirmTextField.alpha = 0.5
        } else {
            passwordConfirmTextField.backgroundColor = UIColor.red
        }
    }
    
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.isEnabled = false
    }
    
}


extension String {
    var isNumeric: Bool {
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self.characters).isSubset(of: nums)
    }
}

//change one color, rotate another, shake a third.  the fourth and fifth maybe combine some elements of the others?
//so emailConfirmationTextField has to == emailTextField.  And passwordConfirmTextField == passwordTextField, too
//So how do I take from the input fields?  as optionals, yeah?  so I bind them...then check.  Turn green if it's good, maybe pop or bounce or something.  if it fails, turn red and spin.  Maybe swing back and forth? if all checks pass, then submit turns green and slides in from the side?
//so first, how do i take?  second, how do I check?  third, how do I animate?  OK.  Got  plan.
