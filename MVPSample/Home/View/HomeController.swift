//
//  HomeController.swift
//  MVPSample
//
//  Created by Sergio Illan Illan on 17/11/21.
//

import UIKit

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource, HomeProtocol{
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var webLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenter?
    
    var user:Users?
    var monsters: [Monsters] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    private func setUI(){
        
        presenter = HomePresenter()
        presenter?.attachView(view: self)
        
        nameLbl.text = "..."
        emailLbl.text = ""
        webLbl.text = ""
        
        setImageProfile(profile: imageProfile)
        setTableCell()
    }
    
    
    
    private func setTableCell(){
        self.tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    
    
    //Delegate Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monsters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(monsters[indexPath.row])")
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func setMonsters() {
        
    }
    

}

