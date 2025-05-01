//
//  WelcomeViewController.swift
//  Login
//
//  Created by Kseniya Ignatyeva on 23/04/2025.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var logoutButton: UIButton!
    var welcomeText: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = welcomeText
    }
}
