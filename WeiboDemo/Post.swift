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
//结构体少一个属性还可以解析，多一个或者对不上就会解析失败
struct Post: Codable{//Codable协议，既可解码又可以编码
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

//解析微博的数据文件
func loadPostListData(fileName: String)->Postlist{
    //从文件夹里取装着json的文件
    //guard保证=后面能取到，否则抛出异常；Bundle是一个文件夹
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil)else{
        fatalError("Can not find \(fileName) in main bundle")
    }
    //从文件读取json数据
    //try?表示取不到就返回空
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Can not find \(url)")
    }
    //JSONDecoder来解析JSON，Postlist.self类似于java里的Postlist.class表示这个类型
    guard let list = try? JSONDecoder().decode(Postlist.self, from: data) else{
        fatalError("Can not parse post list json data")
    }
    return list
}

func loadImage(name: String)->Image{
    return Image(uiImage: UIImage(named: name)!)
}
