//
//  PostDetailView.swift
//  WeiboDemo
//
//  Created by Song on 2020/9/6.
//  Copyright © 2020 song. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    var body: some View {
        List {
            PostCell(post: post)
            .listRowInsets(EdgeInsets())
            
            ForEach(1...10, id: \.self){ i in
                Text("评论\(i)")
            }
        }
        .navigationBarTitle("详情",displayMode: .inline) //lesson 5, 25:40，将上方的bar显示模式设置为inline
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: postList.list[0])
    }
}
