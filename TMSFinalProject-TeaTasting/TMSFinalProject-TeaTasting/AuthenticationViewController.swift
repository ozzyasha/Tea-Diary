//
//  AuthenticationViewController.swift
//  TMSFinalProject-TeaTasting
//
//  Created by Наталья Мазур on 30.01.24.
//

import Foundation
import UIKit

class AuthenticationViewController: UIViewController {
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var enterButton: UIButton!
    
    var viewModel: AuthenticationViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AuthenticationViewModel()
    }
    
    
}
