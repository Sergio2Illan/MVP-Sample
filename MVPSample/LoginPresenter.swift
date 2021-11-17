//
//  LoginPresenter.swift
//  MVPSample
//
//  Created by Sergio Illan Illan on 17/11/21.
//

import Foundation
import UIKit


class LoginPresenter {
    
    var view: LoginController?
    
    init(){
        
    }
    
    func attachView(view: LoginController){
        self.view = view
    }
    
    func validateFields(name: String?, pass: String?){
        guard let user = name else { return }
        guard let password = pass else { return }
        
        if (!user.isEmpty) {
            if (!password.isEmpty ) {
                if isValidEmail(testStr: user){
                    if isValidPassword(pass: password){
                        view?.startLoading()
                        ExternalDataManager.shared.getDataLoginFromServer { data in
                            if self.isUserRegistered(users: data, usuario: user) {
                                //TODO: Save user data to present in the home
                                let user = self.getUser(users: data, user: user)
                                self.view?.stopLoading()
                                self.view?.pushView()
                            }
                            
                        } onFailure: { error in
                            self.view?.pushModal(title: "Error", message: error)
                        }

                    }else {
                        view?.pushModal(title: "Error", message: "The password needs 5 charwcteres including a special character.")
                    }
                }else{
                    view?.pushModal(title: "Error", message: "The format has to be like XXXX@XXXX.XX")
                }
            }else{
                view?.pushModal(title: "Error", message: "The field password is empty.")
            }
        }else {
            view?.pushModal(title: "Error", message: "The field user is empty.")
        }
        
    }
    
    
    private func signIn(){
        view?.stopLoading()
    }
}
