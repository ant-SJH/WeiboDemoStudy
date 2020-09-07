//
//  HomeNavigationBar.swift
//  WeiboDemo
//
//  Created by Song on 2020/9/6.
//  Copyright © 2020 song. All rights reserved.
//

import SwiftUI

private let kLabelWidth: CGFloat = 60 //一般常量会用k开头
private let kButtonHeight: CGFloat = 24

struct HomeNavigationBar: View {
    @State var leftPercent: CGFloat //0 for left, 1 for right @State当这个变量更新了该View就会更新
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            
            Button(action: {
                print("Click camera button")
            }) {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            VStack(spacing: 3) {
                HStack(spacing: 0) {
                    Text("推荐")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(1 - leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation {
                                self.leftPercent = 0
                            }
                        }
                    
                    Spacer()
                    
                    Text("热门")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(0.5 + leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation {
                                self.leftPercent = 1
                            }
                        }
                }
                .font(.system(size: 20))
                
                GeometryReader { geometry in //一个容器，会和Spacer()一样尽可能多的占用空间
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundColor(.orange)
                        .frame(width: 30, height: 4)
                        .offset(x: geometry.size.width * (self.leftPercent - 0.5) + kLabelWidth * (0.5 - self.leftPercent)) //lesson 6,04:10
                }
                .frame(height: 6)
                
            }
            .frame(width: UIScreen.main.bounds.width * 0.5)
            
            Spacer()
            
            Button(action: {
                print("Click add button")
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.orange)
            }
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationBar(leftPercent: 0)
    }
}
