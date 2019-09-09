//
//  ContentView.swift
//  DeleteCell
//
//  Created by Runhua Huang on 2019/9/8.
//  Copyright © 2019 Runhua Huang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var blogStore: BlogStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(blogStore.allblogs) { blog in
                    if self.blogStore.isListChanged {
                        VStack(alignment: .leading) {
                            BlogView(blog: blog, blogs: self.blogStore.allblogs)
                        }
                    } else {
                        VStack(alignment: .leading) {
                            BlogView(blog: blog, blogs: self.blogStore.allblogs)
                        }
                    }
                }
            }.navigationBarTitle(Text("Today"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(BlogStore())
    }
}

struct MoreButtonView: View {
    
    @EnvironmentObject var blogStore: BlogStore
    
    var blog: Blog
    @State var blogs: [Blog]
    
    var blogIndex: Int {
        blogStore.allblogs.firstIndex(where: { $0.id == blog.id })!
    }
    
    var body: some View {
        
        Button(action: { self.delete(at: self.blogIndex) }) {
        Image("more").resizable().frame(width: 30, height: 30)
        }.foregroundColor(Color(.darkGray)).padding(.trailing)
        
        
    }
    
    func delete(at index: Int) {
        blogStore.allblogs.remove(at: index)
        blogStore.isListChanged = true
    }
 
}

struct BlogView: View {
    var blog: Blog
    @State var blogs: [Blog]
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(blog.title)
                    .font(Font.system(size: 20, weight: .bold, design: .serif))
                Text(blog.subTitle)
                    .foregroundColor(Color.gray)
                
            }.layoutPriority(1)
            Spacer().layoutPriority(0.5)
            VStack(alignment: .trailing) {
                Image(blog.image).resizable().frame(width: 100, height: 100).cornerRadius(10.0)
                MoreButtonView(blog: blog, blogs: blogs).layoutPriority(1)
            }
        }
    }
}
