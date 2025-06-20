//
//  ImageViewViewController.swift
//  Login
//
//  Created by Kseniya Semenova on 18.06.2025.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var personImageView: UIImageView!
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        personImageView.image = UIImage(named: user.person.image)
    }
}
