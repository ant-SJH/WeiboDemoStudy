//
//  HomeView.swift
//  WeiboDemo
//
//  Created by Song on 2020/9/6.
//  Copyright © 2020 song. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    init() { //类型的构造方法，
        UITableView.appearance().separatorStyle = .none //隐藏自带的UITableView
        UITableViewCell.appearance().selectionStyle = .none //取消系统自带的点击效果（按下的时候变灰）
    }

    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {//可以滑动显示超出范围的内容
                HStack(spacing: 0) {
                    PostListView(category: .recommend)
                        .frame(width: UIScreen.main.bounds.width)
                    PostListView(category: .hot)
                        .frame(width: UIScreen.main.bounds.width)
                }
            }
            .edgesIgnoringSafeArea(.bottom) //忽略底部的安全区域
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: 0))
            .navigationBarTitle("首页", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
