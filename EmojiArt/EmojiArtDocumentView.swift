//
//  ContentView.swift
//  EmojiArt
//
//  Created by Marcus Adriano on 23/07/20.
//  Copyright © 2020 Marcus Adriano. All rights reserved.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument
    
    var body: some View {
        HStack {
            ForEach(EmojiArtDocument.palette.map { String($0) }, id: \.self) { emoji in
                Text(emoji)
            }
        }
    }
}
