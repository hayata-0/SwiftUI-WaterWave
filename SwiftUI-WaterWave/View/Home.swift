//
//  Home.swift
//  SwiftUI-WaterWave
//
//  Created by 大野颯太 on 2022/03/04.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            Image("Pic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(10)
                .background(.white,in: Circle())
            
            Text("hayata")
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.bottom,30)
            
            //Wave Form
            GeometryReader {proxy in
                let size = proxy.size
                
                ZStack {
                    //Water Drop
                    Image(systemName: "drop.fill")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .scaleEffect(x: 1.1, y: 1)
                    
                    //wave form shape
                    WaterWave(progress: 0.5, waveHeight: 0.1, offset: size.width)
                        .mask{
                            Image(systemName: "drop.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                }
                .frame(width: size.width, height: size.height, alignment: .center)
            }
            .frame(height: 350)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BG"))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct WaterWave:Shape {
    var progress: CGFloat
    
    var waveHeight: CGFloat
    
    var offset: CGFloat
    
    var animatableData: CGFloat{
        get{offset}
        set{offset = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        return Path {path in
            path.move(to: .zero)
            let progressHeight:CGFloat = (1 - progress) * rect.height
            let height = waveHeight * rect.height
            
            for value in stride(from: 0, to: rect.width, by: 2) {
                let x:CGFloat = value
                let sine:CGFloat = sin(Angle(degrees: value + offset).radians)
                let y:CGFloat = progressHeight + (height * sine)
                
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            //Bottom portion
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
        }
    }
}
