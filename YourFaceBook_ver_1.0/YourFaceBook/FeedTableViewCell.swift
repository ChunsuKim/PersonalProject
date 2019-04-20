//
//  FeedTableViewCell.swift
//  YourFaceBook
//
//  Created by Chunsu Kim on 19/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var profileImageView: UIImageView = UIImageView()
    var nickNameLabel: UILabel = UILabel()
    var feedImageView: UIImageView = UIImageView()
    var lineView: UIView = UIView()
    var likeButton: UIButton = UIButton()
    var commentButton: UIButton = UIButton()
    var messageButton: UIButton = UIButton()
    
    
    
    var model: FeedData! {
        didSet{
            profileImageView.image = UIImage(named: self.model.profileImage!)
            nickNameLabel.text = self.model.nickName
            feedImageView.image = UIImage(named: self.model.feedImage!)
        }
    }
    
    // MARK: - init method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(nickNameLabel)
        contentView.addSubview(feedImageView)
        contentView.addSubview(lineView)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(messageButton)
        
        autoLayOut()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - set up method
    func setup() {
        
        lineView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        likeButton.setImage(UIImage(named: "heart"), for: .normal)
        likeButton.setImage(UIImage(named: "heart_color"), for: .selected)
        likeButton.addTarget(self, action: #selector(likeButtonDidTap(_:)), for: .touchUpInside)
        
        commentButton.setImage(UIImage(named: "comment"), for: .normal)
        
        messageButton.setImage(UIImage(named: "share"), for: .normal)
        
    }
    
    // MARK: - AutoLayout
    func autoLayOut() {
        
        // profile Image
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        
        // nickname Label
        nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nickNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        nickNameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nickNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10).isActive = true
        
        // Line
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        lineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        lineView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 5).isActive = true
        
        // feed Image
        feedImageView.translatesAutoresizingMaskIntoConstraints = false
        
        feedImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        feedImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        feedImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -46).isActive = true
        feedImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        feedImageView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 0).isActive = true
        
        // like Button
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        
        likeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        likeButton.topAnchor.constraint(equalTo: feedImageView.bottomAnchor, constant: 0).isActive = true
        
        // comment Button
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        
        commentButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        commentButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 0).isActive = true
        commentButton.topAnchor.constraint(equalTo: feedImageView.bottomAnchor, constant: 0).isActive = true
        
        // message Button
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        
        messageButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        messageButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        messageButton.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 0).isActive = true
        messageButton.topAnchor.constraint(equalTo: feedImageView.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - like button Action method
    @objc func likeButtonDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
}
