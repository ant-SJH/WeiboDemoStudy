//
//  PostCell.swift
//  WeiboDemo
//
//  Created by 宋金杭 on 2020/5/15.
//  Copyright © 2020 song. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack(spacing: 5){
                post.avaterImage
                    .resizable()//表示可以缩放
                    .scaledToFill()//保持宽高比
                    .frame(width: 50,height: 50) //frame表示设置宽、高
                    .clipShape(Circle())//把图片裁成圆形
                    .overlay(//叠加一个视图
                        PostVIPBadge(vip: post.vip)
                        .offset(x: 16,y: 16))
                
                
                VStack(alignment: .leading, spacing: 5){//设置纵向排列左对齐，上下控件间距为5
                    Text(post.name)
                        .font(Font.system(size:30)) //设置字体
                        .foregroundColor(Color(red:242/265,green:99/265,blue:4/265)) //设置字体颜色
                        .lineLimit(1)
                    Text(post.date)
                        .font(.system(size:15))//Font可以省略
                        .foregroundColor(.gray) //Color可以省略
                }
                
                .padding(.leading,10)//设置用户名和头像左边间距为10
                
                if !post.isFollowed {
                    //占空间的view，
                    Spacer()
                    //Button的anction表示点击的动作，第二个{}表示显示的view
                    //在debug模式下才能查看控制台
                    Button(action: {
                        print("Click follow button")
                    }){
                        Text("关注")
                        .font(.system(size:14))
                        .foregroundColor(.orange)
                        .frame(width: 50,height: 26)
                            //overlay在一个view上叠加另一个view，RoundedRectangle表示圆角矩形，stroke表示画一个边框
                        .overlay(RoundedRectangle(cornerRadius: 13)
                            .stroke(Color.orange,lineWidth: 1))
                    }
                }
            }
            
            Text(post.text)
                .font(.system(size: 17))
            
            if !post.images.isEmpty {
                loadImage(name: post.images[0])
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width - 30,height: (UIScreen.main.bounds.width - 30) * 0.75)
                .clipped()
            }
            
            Divider()
            
            HStack(spacing: 0){
                Spacer()
                
                PostCellToolbarButton(image: "message",
                                      text: post.commentCountText,
                                      color: .black,
                                      action: {
                                        print("Click comment button")
                })
                
                Spacer()
                
                PostCellToolbarButton(image: "heart",
                                      text: post.likeCountText,
                                      color: .black,
                                      action: {
                                        print("Click like button")
                })
                
                Spacer()
            }
            
        }.padding(.horizontal,15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        //需要将数据传入
        PostCell(post: postList.list[3])
    }
}
