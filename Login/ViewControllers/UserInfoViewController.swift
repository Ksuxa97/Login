//
//  UserInfoViewController.swift
//  Login
//
//  Created by Kseniya Semenova on 18.06.2025.
//

import UIKit

class UserInfoViewController: UIViewController {

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = user.person.fullName
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.user = user
    }
}
