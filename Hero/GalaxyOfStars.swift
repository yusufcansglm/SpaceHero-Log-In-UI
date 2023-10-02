//
//  GalaxyOfStars.swift
//  Hero
//
//  Created by Yusuf Can Sağlam on 27.09.2023.
//

import SwiftUI

struct GalaxyOfStars: View {
   var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {
                Color(.black)
                ForEach(0..<70) { _ in
                    SparklingStar(fillColor: [.purple, .mint][Int.random(in: 0..<2)], numberOfPoints: 1)
                        .frame(height: 2.0)
                        .position(.init(x: CGFloat.random(in: 10..<proxy.size.width - 10), y: CGFloat.random(in: 10..<proxy.size.height - 10)))
                }
            }
        }
        .ignoresSafeArea()
       
    }
}

struct GalaxyOfStars_Previews: PreviewProvider {
    static var previews: some View {
        GalaxyOfStars()
    }
}
