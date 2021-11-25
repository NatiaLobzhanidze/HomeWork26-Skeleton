//
//  MyTableViewCell.swift
//  HomeWork26
//
//  Created by Natia's Mac on 25/11/2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    public let identifier = "MyTableViewCell"
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with item : MovieModel){
        title.text = item.title
        descriptionLabel.text = item.review
        let urL = "https://image.tmdb.org/t/p/original" + item.image
        let data = try! Data(contentsOf: URL(string: urL)!)
        self.myImage.image = UIImage(data: data)
    }
}
