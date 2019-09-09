//
//  BlogStore.swift
//  DeleteCell
//
//  Created by Runhua Huang on 2019/9/8.
//  Copyright © 2019 Runhua Huang. All rights reserved.
//

import SwiftUI
import Combine

class BlogStore: ObservableObject {
    @Published var allblogs: [Blog] = blogs
    @Published var isListChanged: Bool = false
}


var blogs = [
    Blog(title: "How to Be a Good Senior Developer", subTitle: "It's not what you do-it's how you do it", image: "1"),
    Blog(title: "What You Should Know About high Blood Pressure", subTitle: "Despite a new understanding of the largely preventable disease, deaths from the 'slient killer' are steadily climbing", image: "2"),
    Blog(title: "How to build valuable connections?", subTitle: "Analyzing Slack's marketing strategy", image: "3")
]
