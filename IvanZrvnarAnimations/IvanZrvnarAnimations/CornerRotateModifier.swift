//
//  CornerRotateModifier.swift
//  IvanZrvnarAnimations
//
//  Created by Ivan Zrvnar on 2022-06-28.
//

import Foundation
import SwiftUI
struct CornerRotateModifier: ViewModifier{
    let amount : Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition{
    static var pivot: AnyTransition{
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}
