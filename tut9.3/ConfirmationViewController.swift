//
//  ConfirmationViewController.swift
//  tut9.3
//
//  Created by Felix KHNEN on 8/10/2026.
//

import UIKit

class ConfirmationViewController: UIViewController {

    var orderText = ""

    @IBOutlet weak var orderLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        orderLabel.text = orderText
    }
}
