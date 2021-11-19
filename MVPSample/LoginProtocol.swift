//
//  LoginProtocol.swift
//  MVPSample
//
//  Created by Sergio Illan Illan on 17/11/21.
//

import Foundation


protocol LoginProtocol {
    var presenter: LoginPresenter?  { get set }
    func startLoading()
    func stopLoading()
    func pushView(user: Users)
    func pushModal(title: String, message: String)
    
}
