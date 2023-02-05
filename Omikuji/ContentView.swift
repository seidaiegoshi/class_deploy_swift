//
//  ContentView.swift
//  Omikuji
//
//  Created by 江越正大 on 2023/02/05.
//

import SwiftUI

struct ContentView: View {
    @State var imageName = "omikuji"
    
    var body: some View {
        VStack(spacing:32){
            Image(imageName)
                .resizable()
                .frame(maxWidth: .infinity)
            HStack(spacing:16){
                Button("リセット") {
                    
                }
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(.red)  //背景色を赤に
                .foregroundColor(.white)
                // ここまで
                Button("おみくじを引く") {
                    updateOmikujiImageView()
                }
                .frame(maxWidth: .infinity, minHeight: 50) //サイズ
                .background(.green)  //背景のViewを設定するModifier, ColorというViewのgreenを指定(型推論でColorを省略)
                .foregroundColor(.white) //前面に表示されるView(ここでは"おみくじを引く"というText)の色を設定できるModi
            }
        }
        .padding(40)
    }
    
    func updateOmikujiImageView(){
        let lucks = ["daikichi","kichi","kyou"]
        imageName = lucks[Int.random(in: 0...2)]
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
