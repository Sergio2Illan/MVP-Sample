//
//  ExternalDataManager.swift
//  MVPSample
//
//  Created by Sergio Illan Illan on 17/11/21.
//

import Foundation
import Alamofire

class ExternalDataManager {
    
    var user: [Users] = []
    
    
     static let shared: ExternalDataManager = {
        let instance = ExternalDataManager()
        return instance
     }()
    
    
    func getDataLoginFromServer(onSuccess success: @escaping([Users])->(), onFailure failure: @escaping(String)->()) {
        
        AF.request("\(Constants.URL.url)\(Constants.URL.endpointUsers)").responseJSON { response in
            
            guard let codeStatus = response.response?.statusCode else { return }
            
            if codeStatus == 200 {
                
                guard let data = response.data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    self.user =  try decoder.decode([Users].self, from: data)
                    success(self.user)
                } catch let error {
                    failure("Error ----> \(error.localizedDescription)")
                }
                
            }else{
                failure("Error: Server temporarily unreachable")
            }
        }
    }
    
    func getCapturedPokemonFromServer(onSuccess success: @escaping([Users])->(), onFailure failure: @escaping(String)->()) {
        
    }
    
}
