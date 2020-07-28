//
//  EmojiArtDocument.swift
//  EmojiArt
//
//  Created by Marcus Adriano on 23/07/20.
//  Copyright © 2020 Marcus Adriano. All rights reserved.
//

import SwiftUI

class EmojiArtDocument: ObservableObject {
    static let palette: String = "🐝🦏🥬🍎💚📱"
    
    @Published private var emojiArt: EmojiArt = EmojiArt()
    
    @Published private(set) var backgroundImage: UIImage?
    
    // MARK: - Intent(s)
    
    func addEmoji(_ emoji: String, at location: CGPoint, size: CGFloat) {
        emojiArt.addEmoji(emoji, x: Int(location.x), y: Int(location.y), size: Int(size))
    }
    
    func moveEmoji(_ emoji: EmojiArt.Emoji, by offset: CGSize) {
        if let index = emojiArt.emojis.firstIndex(matching: emoji) {
            emojiArt.emojis[index].x += Int(offset.width)
            emojiArt.emojis[index].y += Int(offset.height)
        }
    }
    
    func sacelEmoji(_ emoji: EmojiArt.Emoji, by scale: CGFloat) {
        if let index = emojiArt.emojis.firstIndex(matching: emoji) {
            emojiArt.emojis[index].size = Int((CGFloat(emojiArt.emojis[index].size) * scale).rounded(.toNearestOrEven))
        }
    }
    
    func setBackgroundURL(_ url: URL?) {
        emojiArt.backgroundURL = url?.imageURL
        fetchBackgroundImageData()
    }
    
    private func fetchBackgroundImageData() {
        backgroundImage = nil
        DispatchQueue.global(qos: .userInitiated).async {
            if let url = self.emojiArt.backgroundURL {
                if let imageData = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.backgroundImage = UIImage(data: imageData)
                    }                    
                }
            }
        }
    }
}
