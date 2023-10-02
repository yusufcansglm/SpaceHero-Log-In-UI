//
//  SparklingStar.swift
//  Hero
//
//  Created by Yusuf Can Sağlam on 27.09.2023.
//
import SwiftUI

struct SparklingStar: View {
    let fillColor: Color
    let numberOfPoints: Int // Nokta sayısını ekliyoruz
    
    @State private var isAnimating: [Bool] // Her bir nokta için animasyon durumunu depolamak için dizi kullanıyoruz
    
    init(fillColor: Color, numberOfPoints: Int) {
        self.fillColor = fillColor
        self.numberOfPoints = numberOfPoints
        _isAnimating = State(initialValue: Array(repeating: false, count: numberOfPoints)) // Başlangıçta her noktanın animasyonu kapalı
    }
    
    var body: some View {
        GeometryReader { proxy in
            ForEach(0..<numberOfPoints, id: \.self) { index in // Her bir noktayı döngü ile oluşturuyoruz
                Path { path in
                    let center = CGPoint(x: proxy.size.width / 2, y: proxy.size.height / 2)
                    let width = min(proxy.size.height, proxy.size.width)
                    path.addArc(center: center, radius: width / 2, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
                }
                .fill(fillColor)
                .shadow(color: fillColor, radius: 15.0)
                .scaleEffect(isAnimating[index] ? 1.2 : 1.0)
                .opacity(isAnimating[index] ? 0.5 : 1.0)
                .animation(Animation.easeInOut(duration: Double.random(in: 0.5...2.0)).repeatForever(autoreverses: true)) // Rastgele animasyon süresi
                .onAppear() {
                    self.isAnimating[index] = true // Görünüm belirdiğinde animasyonu başlatıyoruz
                }
            }
        }
    }
}

struct SparklingStar_Previews: PreviewProvider {
    static let color1 = Color(red: 255/255, green: 119/255, blue: 103/255)
    
    static var previews: some View {
        SparklingStar(fillColor: .yellow, numberOfPoints: 5)
            .frame(width: 20)
    }
}


