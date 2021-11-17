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
    
    func validateFields(){
        view?.startLoading()
    }
}
