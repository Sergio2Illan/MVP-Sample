//
//  CustomCell.swift
//  MVPSample
//
//  Created by Sergio Illan Illan on 19/11/21.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    private func setupUI() {
            
            titleLbl.text = ""
            subtitleLbl.text = ""
            imagen.layer.cornerRadius = imagen.bounds.height / 2
            imagen.clipsToBounds = true
        }
    
}
