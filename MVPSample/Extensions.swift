//
//  Extensions.swift
//  MVPSample
//
//  Created by Sergio Illan Illan on 17/11/21.
//

import Foundation
import UIKit

extension LoginPresenter {
    
    func showAlert(title: String, mensaje: String, vc: UIViewController){
        let alert = UIAlertController(title: title, message: mensaje, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Aceptar", style: .default) { done in
        }
        alert.addAction(okButton)
        vc.present(alert, animated: true, completion: nil)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    func isValidPassword(pass: String) -> Bool {
        
        print("Validate password: \(pass)")
        
        if pass.count >= 5 {
            let pattern = ".*[^A-Za-z0-9].*"
            let passTest = NSPredicate(format:"SELF MATCHES %@", pattern)
            let result = passTest.evaluate(with: pass)
            return result
            
        }else {
            return false
        }
    }
    
   func isUserRegistered(users: [Users], usuario: String) -> Bool{
        var encontrado = false
        for user in users {
            if (usuario.elementsEqual(user.email)) {
                encontrado = true
                break
            }
        }
        return encontrado
    }
    
    func isEqualString(users: [Users], password: String) -> Bool{
        var equal = false
        for user in users {
            if (password.elementsEqual(user.password)) {
                equal = true
                break
            }
        }
        return equal
    }
    
    func nameFromEmail(users: [Users], usuario: String)-> String {
        var name = ""
        for user in users {
            if (usuario.elementsEqual(user.email)) {
                name = user.name
                break
            }
        }
        return name
    }
}
