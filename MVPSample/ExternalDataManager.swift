//
//  ExternalDataManager.swift
//  MVPSample
//
//  Created by Sergio Illan Illan on 17/11/21.
//

import Foundation

class ExternalDataManager {
    
    var user: [Users] = []
    
    
     static let shared: ExternalDataManager = {
        let instance = ExternalDataManager()
        return instance
     }()
    
    func getDataFromServer(onSuccess success: @escaping([Users])->(), onFailure failure: @escaping(String)->()) {
        
    }
    
}
