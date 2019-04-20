//
//  FeedData.swift
//  YourFaceBook
//
//  Created by Chunsu Kim on 18/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

class FeedData {
    let profileImage: String?
    let nickName: String?
    let feedImage: String?
    
    init(profileImage: String?, nickName: String?, feedImage: String?) {
        self.profileImage = profileImage ?? AppImageData.profile + "\(1)"
        self.nickName = nickName ?? "NickName"
        self.feedImage = feedImage ?? AppImageData.feedImage + "\(1)"
    }
}
