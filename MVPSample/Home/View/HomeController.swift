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
    private var monsters: [Monsters] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        loadData()
        
    }
    
    private func setUI(){
        
        presenter = HomePresenter()
        presenter?.attachView(view: self)
        presenter?.callServer()
        
        
        nameLbl.text = "..."
        emailLbl.text = ""
        webLbl.text = ""
        
        setImageProfile(profile: imageProfile)
        setTableCell()
    }
    
    
    private func loadData(){
        guard let usu = user else {return}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.nameLbl.text = usu.name
            self.emailLbl.text = usu.email
            self.webLbl.text = usu.website
            self.imageProfile.image = UIImage(named: "me")
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.tableView.reloadData()
        }
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
        cell.imagen.image = parseStringToImage(imageUrlString: monsters[indexPath.row].image)
        cell.titleLbl.text = monsters[indexPath.row].name
        cell.subtitleLbl.text = "Gotta Catch ‘Em All!"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(monsters[indexPath.row])")
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func setMonsters(monsters: [Monsters]) {
        self.monsters = monsters
        //self.tableView.reloadData()
    }
    
    func pushModal(title: String, message: String) {
        showAlert(title: title, mensaje: message, vc: self)
    }
    

}

