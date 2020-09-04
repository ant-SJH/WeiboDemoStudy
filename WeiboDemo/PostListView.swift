//
//  PostListView.swift
//  WeiboDemo
//
//  Created by 宋金杭 on 2020/5/15.
//  Copyright © 2020 song. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    var body: some View {
        List(postList.list,id: \.id){post in
            PostCell(post: post)
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
