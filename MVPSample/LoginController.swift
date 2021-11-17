//
//  LoginController.swift
//  MVPSample
//
//  Created by Sergio Illan Illan on 17/11/21.
//

import UIKit

class LoginController: UIViewController, LoginProtocol {
    
    
    // Delegate var
    var presenter: LoginPresenter?
    

    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var titleLogo: UILabel!
    @IBOutlet weak var userTfd: UITextField!
    @IBOutlet weak var sigInBtn: CustomButton!
    @IBOutlet weak var passTfd: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }


    @IBAction func didSignIn(_ sender: Any) {
        presenter?.validateFields(name: userTfd.text, pass: passTfd.text)
    }
    
    func setUI(){
        self.spinner.hidesWhenStopped = true
        self.spinner.isHidden = true
        //self.passTfd.secureTextEntry = true
        presenter = LoginPresenter()
        presenter?.attachView(view: self)
    }
    
    
    func startLoading() {
        DispatchQueue.main.async {
            self.spinner.isHidden = false
            self.spinner.startAnimating()
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            self.spinner.hidesWhenStopped = true
        }
    }
    
    func pushView() {
        let home = HomeController(nibName: "HomeController", bundle: .main)
        home.modalTransitionStyle = .crossDissolve
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }
    
    func pushModal(title: String, message: String) {
        showAlert(title: title, mensaje: message, vc: self)
    }

}


