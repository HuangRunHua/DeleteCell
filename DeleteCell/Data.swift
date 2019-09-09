//
//  Data.swift
//  DeleteCell
//
//  Created by Runhua Huang on 2019/9/8.
//  Copyright © 2019 Runhua Huang. All rights reserved.
//

import SwiftUI

struct Blog: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var subTitle: String
    var image: String
}
