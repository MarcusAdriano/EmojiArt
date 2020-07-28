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
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(EmojiArtDocument.palette.map { String($0) }, id: \.self) { emoji in
                        Text(emoji)
                            .font(Font.system(size: self.emojiFontSize))
                    }
                }
            }
            .padding(.horizontal)
            Color.white.overlay(
                Group {
                    if self.document.backgroundImage != nil {
                        Image(uiImage: self.document.backgroundImage!)
                    }
                }
            )
                .edgesIgnoringSafeArea([.horizontal, .vertical])
                .onDrop(of: ["public.image"], isTargeted: nil) { providers, location in
                    return self.drop(providers: providers)
                }
        }
    }
    
    private func drop(providers: [NSItemProvider]) -> Bool {
        let found = providers.loadFirstObject(ofType: URL.self) { url in
            print("Dropped \(url)")
            self.document.setBackgroundURL(url)
        }
        return found
    }
    
    // MARK: - Design constants
    private let emojiFontSize: CGFloat = 40.0
}
