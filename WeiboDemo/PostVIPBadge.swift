//
//  PostVIPBadge.swift
//  WeiboDemo
//
//  Created by 宋金杭 on 2020/5/15.
//  Copyright © 2020 song. All rights reserved.
//

import SwiftUI

struct PostVIPBadge: View {
    let vip: Bool
    
    var body: some View {
        Group{//放在一个分组里
            if vip {
                Text("v")
                .bold()
                .font(.system(size:11))
                .frame(width: 15,height: 15)
                .background(Color.red)
                .clipShape(Circle())
                .overlay(
                    RoundedRectangle(cornerRadius: 7.5)
                    .stroke(Color.white,lineWidth: 1))
            }
        }
        
    }
}

struct PostVIPBadge_Previews: PreviewProvider {
    static var previews: some View {
        PostVIPBadge(vip: true)
    }
}
