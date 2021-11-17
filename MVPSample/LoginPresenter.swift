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
        view?.startLoading()
        guard let name = name else { return }
        guard let pass = pass else { return }
        
        if (name.count > 0 && name != "" ) {
            if (pass.count > 0 && pass != "" ) {
                if isValidEmail(testStr: name){
                    if isValidPassword(pass: pass){
                        ExternalDataManager.shared.getDataFromServer { data in
                            
                            //TODO: Call function to validate data
                            
                        } onFailure: { error in
                            //TODO: Show error menssaged
                        }

                    }else {
                        //TODO: Show error menssage
                    }
                }else{
                    //TODO: Show error menssage
                }
            }else{
                //TODO: Show error menssage
            }
        }else {
            //TODO: Show error menssage
        }
        
    }
}
