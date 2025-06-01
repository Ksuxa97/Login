//
//  ViewController.swift
//  Login
//
//  Created by Kseniya Ignatyeva on 23/04/2025.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = "User"
    private let password = "Password"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.placeholder = "Login"
        passwordTextField.placeholder = "Password"
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)  // Скрывает клавиатуру для всех полей
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        guard let userName = loginTextField?.text else {return}
        welcomeVC.welcomeText = "Welcome, \(userName)!"
    }
    
    @IBAction func unwindSegue(for segue: UIStoryboardSegue) {
        self.loginTextField.text = ""
        self.passwordTextField.text = ""
    }
    
    @IBAction func loginButtonPressed() {
        guard loginTextField.text == user, passwordTextField.text == password else {
            showAlert(
                title: "Error",
                message: "Invalid login or password",
                textField: passwordTextField
            )
            return
        }
        
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    @IBAction func showAuthorizationData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(user) 😉")
        : showAlert(title: "Oops!", message: "Your password is \(password) 😉")
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Keyboard

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        }
        else {
            loginButtonPressed()
        }
        return true
    }
    
}
