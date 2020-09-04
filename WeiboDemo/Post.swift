//
//  Post.swift
//  WeiboDemo
//
//  Created by 宋金杭 on 2020/5/15.
//  Copyright © 2020 song. All rights reserved.
//

import SwiftUI

struct Postlist: Codable {
    var list: [Post]
}


//Data Model
struct Post: Codable{
    let id: Int
    let avatar: String //头像,图片名称
    let vip: Bool
    let name: String
    let date: String
    
    var isFollowed: Bool
    
    let text: String
    let images: [String]
    
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
}

//拓展
extension Post{
    var avaterImage: Image{
        return loadImage(name: avatar)
    }
    
    //只读属性
    var commentCountText: String{
        if commentCount <= 0 {return "评论"}
        if commentCount < 1000 {return "\(commentCount)"}
        return String(format: "%.1fk",Double(commentCount) / 1000)
    }
    
    var likeCountText: String{
        if likeCount <= 0 {return "点赞"}
        if likeCount < 1000 {return "\(likeCount)"}
        return String(format: "%.1fk",Double(likeCount) / 1000)
    }
}

let postList = loadPostListData(fileName: "PostListData_recommend_1.json")

func loadPostListData(fileName: String)->Postlist{
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil)else{
        fatalError("Can not find \(fileName) in main bundle")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Can not find \(url)")
    }
    guard let list = try? JSONDecoder().decode(Postlist.self, from: data) else{
        fatalError("Can not parse post list json data")
    }
    return list
}

func loadImage(name: String)->Image{
    return Image(uiImage: UIImage(named: name)!)
}
