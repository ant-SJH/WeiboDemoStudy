//
//  PostCellToolbarButton.swift
//  WeiboDemo
//
//  Created by 宋金杭 on 2020/5/15.
//  Copyright © 2020 song. All rights reserved.
//

import SwiftUI

struct PostCellToolbarButton: View {
    let image: String
    let text: String
    let color: Color
    let action: () -> Void //closure闭包
    var body: some View {
        Button(action: action){
            HStack(spacing: 5){
                Image(systemName: image) //systemName系统图片
                    .resizable()
                    .scaledToFit()//适应整个空间，用fit不会超出屏幕的范围，fill会
                    .frame(width: 18,height: 18)
                Text(text)
                    .font(.system(size: 15))
            }
        }
        .buttonStyle(BorderlessButtonStyle())
        .foregroundColor(color)
    }
}

struct PostCellToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolbarButton(image: "heart", text: "点赞", color: .red){
            print("点赞")
        }
    }
}
