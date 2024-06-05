//
//  FavoritesGridItem.swift
//  MVPattern
//
//  Created by Anthony Tran on 5/6/24.
//

import SwiftUI

struct FavoritesGridItem: View {
    
    let item: FavoriteItem
    
    var body: some View {
        DogImageView(resource: item.resource)
            .clipShape(.rect(cornerRadius: 4))
            .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    FavoritesGridItem(item: .mock)
}
