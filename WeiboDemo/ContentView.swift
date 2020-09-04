//
//  ContentView.swift
//  WeiboDemo
//
//  Created by 宋金杭 on 2020/5/15.
//  Copyright © 2020 song. All rights reserved.
//

import SwiftUI

//struct 结构体名字: 继承的类名 {}
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

//提供预览的方法，删掉就没有旁边的预览了
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
