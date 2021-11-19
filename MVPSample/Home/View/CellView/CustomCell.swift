//
//  CustomCell.swift
//  MVPSample
//
//  Created by Sergio Illan Illan on 19/11/21.
//

import UIKit
import SkeletonView

class CustomCell: UITableViewCell {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        setupSkeleton()
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
    
    
    private func setupSkeleton() {
            
        isSkeletonable = true
        
        titleLbl.isSkeletonable = true
        titleLbl.linesCornerRadius = 8
        subtitleLbl.isSkeletonable = true
        subtitleLbl.linesCornerRadius = 8
        imagen.isSkeletonable = true
    }
    
    
    
}
