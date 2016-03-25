//
//  SignUpViewController.swift
//  Clipo
//
//  Created by TUNGYING-CHAO on 3/25/16.
//  Copyright © 2016 TUNGYING-CHAO. All rights reserved.
//

import UIKit
import Material

class SignUpViewController: UIViewController {


    
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var userNameTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var signUpBtn: FlatButton!
    @IBOutlet weak var cancelBtn: FlatButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSignUpView()
        self.hideKeyBoardWhenTapped()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func setupSignUpView(){
        self.setupTextFieldView(self.emailTextField, placeholder: "Email:")
        self.setupTextFieldView(self.userNameTextField, placeholder: "User Name:")
        self.passwordTextField.secureTextEntry = true
        self.setupTextFieldView(self.passwordTextField, placeholder: "Password:")
        
        self.setupBtnView(self.signUpBtn, text: "Sign Up")
        self.setupBtnView(self.cancelBtn, text: "Cancel")
    }
    
    func setupTextFieldView(target: TextField, placeholder: String){
        target.placeholder = placeholder
        target.placeholderTextColor = MaterialColor.grey.base
        target.textColor = MaterialColor.black
        target.titleLabel = UILabel()
        target.titleLabelColor = MaterialColor.grey.base
        target.titleLabelActiveColor = MaterialColor.red.base
    }
    
    func setupBtnView(target: FlatButton, text: String){
        target.setTitle(text, forState: .Normal)
        target.setTitleColor(MaterialColor.red.base, forState: .Normal)
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
