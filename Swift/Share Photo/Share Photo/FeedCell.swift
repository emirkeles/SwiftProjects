//
//  FeedCell.swift
//  Share Photo
//
//  Created by Emir Keleş on 30.05.2023.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var emailText: UILabel!
    @IBOutlet weak var yorumText: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
