//
//  PalleteChooser.swift
//  EmojiArt
//
//  Created by Marcus Adriano on 03/08/20.
//  Copyright © 2020 Marcus Adriano. All rights reserved.
//

import SwiftUI

struct PaletteChooser: View {
    var body: some View {
        HStack {
            Stepper()
            Text("Paletter Name")
        }
    }
}

struct PalleteChooser_Previews: PreviewProvider {
    static var previews: some View {
        PaletteChooser()
    }
}
