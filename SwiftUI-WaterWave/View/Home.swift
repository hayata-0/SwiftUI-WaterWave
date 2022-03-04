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
            
            //Wave Form
            GeometryReader {proxy in
                let size = proxy.size
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
