//
//  PostImageCell.swift
//  WeiboDemo
//
//  Created by Song on 2020/9/6.
//  Copyright © 2020 song. All rights reserved.
//

import SwiftUI

private let kImageSpace: CGFloat = 6 //图片之间的间距

struct PostImageCell: View {
    let images: [String] //表示是一个String的数组
    let width: CGFloat //页面的宽高一般都是CGFloat，一个小数
    var body: some View {
        Group {
            if images.count == 1 {
                loadImage(name: images[0])
                    .resizable()//图片可以拉伸
                    .scaledToFill()//保持原图的比例填满
                    .frame(width: width,height: width * 0.75) //UIScreen.main.bounds.width表示屏幕的宽度，frame指定宽高
                    .clipped() //把超出的部分裁掉
            } else if images.count == 2 {
                 PostImageCellRow(images: images, width: width)
            } else if images.count == 3 {
                PostImageCellRow(images: images, width: width)
            } else if images.count == 4 {
                VStack(spacing: kImageSpace) {
                    PostImageCellRow(images: Array(images[0...1]), width: width)
                    PostImageCellRow(images: Array(images[2...3]), width: width)
                }
            } else if images.count == 5 {
                VStack(spacing: kImageSpace) {
                    PostImageCellRow(images: Array(images[0...1]), width: width)
                    PostImageCellRow(images: Array(images[2...4]), width: width)
                }
            } else if images.count == 6 {
                VStack(spacing: kImageSpace) {
                    PostImageCellRow(images: Array(images[0...2]), width: width)
                    PostImageCellRow(images: Array(images[3...5]), width: width)
                }
            }
        }
    }
}

//一行照片显示的照片
struct PostImageCellRow: View {
    let images: [String]
    let width: CGFloat
    
    var body: some View {
        HStack(spacing: kImageSpace) {
            ForEach(images, id: \.self) { image in //id: \.self表示id就是PostImageCellRow的images，在闭包中自身用self表示
            loadImage(name: image)
                .resizable()
                .scaledToFill()
                .frame(width: (self.width - kImageSpace * CGFloat(self.images.count - 1)) / CGFloat(self.images.count),
                       height: (self.width - kImageSpace * CGFloat(self.images.count - 1)) / CGFloat(self.images.count))//6 * CGFloat(self.images.count - 1)表示减去图片之间的间距之和，两张图片之间间距为6，三张就为12。整个表达式指屏幕宽度减去图片之间的间距最后除以图片的数量来平分宽度。
                .clipped()
            }
        }
    }
}

struct PostImageCell_Previews: PreviewProvider {
    static var previews: some View {
        let images = postList.list[0].images
        let width = UIScreen.main.bounds.width
        return Group {
            PostImageCell(images: Array(images[0...0]), width: width)
            PostImageCell(images: Array(images[0...1]), width: width)
            PostImageCell(images: Array(images[0...2]), width: width)
            PostImageCell(images: Array(images[0...3]), width: width)
            PostImageCell(images: Array(images[0...4]), width: width)
            PostImageCell(images: Array(images[0...5]), width: width)
        }
        .previewLayout(.fixed(width: width, height: 300)) //表示设置预览页不显示整个iphone，这里指定为屏幕宽度*300
    }
}
