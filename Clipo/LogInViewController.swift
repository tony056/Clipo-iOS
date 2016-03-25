//
//  LogInViewController.swift
//  Clipo
//
//  Created by TUNGYING-CHAO on 3/25/16.
//  Copyright © 2016 TUNGYING-CHAO. All rights reserved.
//

import UIKit
import Material

class LogInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: TextField!
    
    @IBOutlet weak var signUpBtn: FlatButton!
    @IBOutlet weak var passwordTextField: TextField!
    
    
    @IBAction func goToSignUp(sender: FlatButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTextFieldView()
        self.hideKeyBoardWhenTapped()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTextFieldView() -> Void{
        self.userNameTextField.placeholder = "User Name: "
        self.userNameTextField.placeholderTextColor = MaterialColor.grey.base
        self.userNameTextField.textColor = MaterialColor.black
        
        self.userNameTextField.titleLabel = UILabel()
        self.userNameTextField.titleLabelColor = MaterialColor.grey.base
        self.userNameTextField.titleLabelActiveColor = MaterialColor.red.base
        
        self.passwordTextField.secureTextEntry = true
        self.passwordTextField.placeholder = "Password: "
        self.passwordTextField.placeholderTextColor = MaterialColor.grey.base
        self.passwordTextField.textColor = MaterialColor.black
        self.passwordTextField.titleLabel = UILabel()
        self.passwordTextField.titleLabelColor = MaterialColor.grey.base
        self.passwordTextField.titleLabelActiveColor = MaterialColor.red.base
        
        self.signUpBtn.setTitle("Sign Up", forState: .Normal)
        self.signUpBtn.setTitleColor(MaterialColor.red.base, forState: .Normal)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIViewController {
    func hideKeyBoardWhenTapped() -> Void {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyBoard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyBoard() -> Void{
        view.endEditing(true)
    }
    
    
}
