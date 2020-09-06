//
//  PostListView.swift
//  WeiboDemo
//
//  Created by 宋金杭 on 2020/5/15.
//  Copyright © 2020 song. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    
    let category: PostListCategory
    
    var postList: Postlist {
        switch category {
        case .recommend:
            return loadPostListData(fileName: ("PostListData_recommend_1.json"))
        case .hot:
            return loadPostListData(fileName: ("PostListData_hot_1.json"))
        }
    }
    
    var body: some View {
        List {
            ForEach(postList.list) {//原本是ForEach(postList.list, id: \.id)但是Post遵循Identifiable协议，可以省略id
                post in ZStack {//lesson 5，20:15左右
                    PostCell(post: post)
                    NavigationLink(destination: PostDetailView(post: post)) {//因为NavigationLink在右边会有一个小箭头，所以创建一个垂直容器，把这个箭头隐藏，只显示PostCell
                        EmptyView()
                    }
                    .hidden()
                }
                .listRowInsets(EdgeInsets()) //使每项list都和屏幕边缘保持一定距离，配合ForEach使用
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {//lesson 5，18:30左右
            PostListView(category: .recommend)
            .navigationBarTitle("title")
            .navigationBarHidden(true) //前面必须设置了navigationBarTitle，否则是不起作用的
        }
    }
}
