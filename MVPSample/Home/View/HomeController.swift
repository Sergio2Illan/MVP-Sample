//
//  HomeController.swift
//  MVPSample
//
//  Created by Sergio Illan Illan on 17/11/21.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var webLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var user:Users?
    var mosnters: [Monsters] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    private func setUI(){
        
        nameLbl.text = "..."
        emailLbl.text = ""
        webLbl.text = ""
        
        setImageProfile(profile: imageProfile)
        setTableCell()
    }
    
    
    
    private func setTableCell(){
        
        
    }
    


    

}
