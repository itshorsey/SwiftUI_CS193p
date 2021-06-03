//
//  ContentView.swift
//  Memorize
//
//  Created by Jonathan Horsman on 6/2/21.
//

import SwiftUI

var smileysList = ["😜", "😊", "😉","😇", "🤩", "🥳", "😎", "🤓", "🤠", "🤑", "🤕", "😤"]
var foodList = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍅", "🍆", "🥑", "🥦", "🍔"]
var objectList = ["⌚️", "📱", "💻", "🖥", "🖨", "🖱", "💽", "📺", "🎙", "🧭", "🕰", "🕯"]

struct ContentView: View {
    // var emojis: Array<String> = ["😜", "😊", "😉"]
    // var emojis: [String] = ["😜", "😊", "😉"]
    
    @State private var displayList = smileysList
    @State private var currentTheme = "smileysList"
    
    var body: some View {
        VStack {
            Text("Memorize")
                .font(.largeTitle)
                .padding()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 60, maximum: 120))]) {
                    ForEach(displayList, id: \.self, content: { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                }
                .padding(.horizontal)
                .foregroundColor(.red)
            }
            
            HStack {
                ThemeView(themeName: "Smileys", themeImage: "face.smiling", action: {
                    displayList.removeAll()
                    displayList.append(contentsOf: smileysList.shuffled()[0...Int.random(in: 3...smileysList.count-1)])
                }).padding()
                Spacer()
                ThemeView(themeName: "Food", themeImage: "leaf", action: {
                    displayList.removeAll()
                    displayList.append(contentsOf: foodList.shuffled()[0...Int.random(in: 3...foodList.count-1)])
                })
                Spacer()
                ThemeView(themeName: "Objects", themeImage: "desktopcomputer", action: {
                    displayList.removeAll()
                    displayList.append(contentsOf: objectList.shuffled()[0...Int.random(in: 3...objectList.count-1)])
                }).padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}


struct CardView: View {
    var content: String
    @State var faceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            
            if faceUp {
                shape.fill()
                    .foregroundColor(.white)
                shape.stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            faceUp = !faceUp
        }
    }
}

struct ThemeView: View {
    var themeName: String
    var themeImage: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            VStack {
                Image(systemName: themeImage)
                Text(themeName).font(.body)
            }
        }
    }
}
