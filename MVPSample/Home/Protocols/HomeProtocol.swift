//
//  HomeProtocol.swift
//  MVPSample
//
//  Created by Sergio Illan Illan on 19/11/21.
//

import Foundation


protocol HomeProtocol {
    var presenter: HomePresenter?  { get set }
    
    func setMonsters()
    
}
