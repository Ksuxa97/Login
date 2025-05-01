//
//  ViewController.swift
//  Login
//
//  Created by Kseniya Ignatyeva on 23/04/2025.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var login: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var getLogin: UIButton!
    @IBOutlet var getPwd: UIButton!
    @IBOutlet var logIn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        login.placeholder = "Login"
        password.placeholder = "Password"
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        login.delegate = self
        password.delegate = self
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)  // Скрывает клавиатуру для всех полей
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == login {
            password.becomeFirstResponder()
        } else if textField == password && !(password.text?.isEmpty ?? true) {
            
        }
        else { textField.resignFirstResponder() } // 3️⃣ Убираем фокус с поля
        
        return true  // 4️⃣ Разрешаем действие
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        guard let userName = login?.text else {return}
        welcomeVC.welcomeText = "Welcome, \(userName)!"
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        self.login.text = ""
        self.password.text = ""
    }
    
    @IBAction func showPassword(){
        let alert = UIAlertController(
                title: "Your password is:",
                message: "123",
                preferredStyle: .alert
            )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    // Метод для скрытия клавиатуры тапом по экрану
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super .touchesBegan(touches, with: event)
//        view.endEditing(true)  // Скрывает клавиатуру
//    }



}

