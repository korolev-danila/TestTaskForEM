//
//  AsyncImg.swift
//  TestTaskForEM
//
//  Created by Danila on 24.03.2023.
//

import SwiftUI

struct AsyncImg: View {
    
    var url: String?
    
    var body: some View {
        AsyncImage(url: URL(string: url ?? "" )) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else if phase.error != nil {
                Color.gray
            } else {
                Color.clear
            }
        }
    }
}
