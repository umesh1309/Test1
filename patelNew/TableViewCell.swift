//
//  TableViewCell.swift
//  patelNew
//
//  Created by PNBS05 on 21/11/20.
//

import UIKit
import Foundation

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageOne: UIImageView!
   
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        class JSONModel{
            
            var image: UIImage
            var title: String

            init(image: UIImage, title: String) {
                self.image = image
                self.title = title
            }
            
        }

    }
}
