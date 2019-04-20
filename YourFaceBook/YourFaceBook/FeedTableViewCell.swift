//
//  FeedTableViewCell.swift
//  YourFaceBook
//
//  Created by Chunsu Kim on 19/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    weak var profileImageView: UIImageView!
    weak var nickNameLabel: UILabel!
    weak var feedImageView: UIImageView!
    
    
    var model: FeedData! {
        didSet{
            profileImageView.image = UIImage(named: self.model.profileImage!)
            nickNameLabel.text = self.model.nickName
            feedImageView.image = UIImage(named: self.model.feedImage!)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.addSubview(profileImageView)
        self.addSubview(nickNameLabel)
        self.addSubview(feedImageView)
        setup()
        autoLayOut()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
    }
    
    func autoLayOut() {
        
        profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func likeButtonDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
}
