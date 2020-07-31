//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Marcus Adriano on 29/07/20.
//  Copyright © 2020 Marcus Adriano. All rights reserved.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}
