import SwiftUI

struct ContentView: View {
    @State var result = "結果"
    @State var imageName = "janken"
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(maxWidth: .infinity)
            HStack {
                Button("ぐー") {
                    showResult(myHand: .gu)
                }
                .frame(maxWidth: .infinity, minHeight: 50) //サイズ
                .background(.green)  //背景のViewを設定するModifier, ColorというViewのgreenを指定(型推論でColorを省略)
                .foregroundColor(.white)
                Button("ちょき") {
                    showResult(myHand: .choki)
                }
                .frame(maxWidth: .infinity, minHeight: 50) //サイズ
                .background(.red)  //背景のViewを設定するModifier, ColorというViewのgreenを指定(型推論でColorを省略)
                .foregroundColor(.white)
                Button("ぱー") {
                    showResult(myHand: .pa)
                }
                .frame(maxWidth: .infinity, minHeight: 50) //サイズ
                .background(.blue)  //背景のViewを設定するModifier, ColorというViewのgreenを指定(型推論でColorを省略)
                .foregroundColor(.white)
            }
            Text(result)
        }
        .padding()
    }

    func showResult(myHand: JankenHand) {
        let comHand = JankenHand(rawValue: Int.random(in: 0...2))!
        imageName = comHand.imageName
        if myHand == .gu {
            if comHand == .gu {
                result = "引き分け"
            } else if comHand == .choki {
                result = "勝ち"
            } else {
                result = "負け"
            }
        } else if myHand == .choki {
            if comHand == .gu {
                result = "負け"
            } else if comHand == .choki {
                result = "引き分け"
            } else {
                result = "勝ち"
            }
        } else {
            if comHand == .gu {
                result = "勝ち"
            } else if comHand == .choki {
                result = "負け"
            } else {
                result = "引き分け"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum JankenHand: Int, Equatable {
    case gu, choki, pa
    var imageName: String {
        switch self {
        case .gu:
            return "gu"
        case .choki:
            return "choki"
        case .pa:
            return "pa"
        }
    }
}
