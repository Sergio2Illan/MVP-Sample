//
//  HomePresenter.swift
//  MVPSample
//
//  Created by Sergio Illan Illan on 19/11/21.
//

import Foundation
import UIKit


class HomePresenter {
    
    var view: HomeController?
    
    init(){
        
    }
    
    func attachView(view: HomeController){
        self.view = view
    }
    
    func callServer(){
        ExternalDataManager.shared.getCapturedMonstersFromServer { monsters in
            self.view?.setMonsters(monsters: monsters)
        } onFailure: { error in
            self.view?.pushModal(title: "Error", message: error)        }

    }
    
    
}
