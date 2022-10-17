//
//  Vlad Vitalaru
//  Besim Krnjic
//
//  ContentView.swift
//  Final


import SwiftUI

struct ContentView: View {
    
    @State var showAlert = false
    @State public var refresh = 0
    var gamedata = logic() // Instance of logic gamedata
    
    var body: some View { // main view
        VStack {
            HStack {
                Text(String(refresh))
                Text("Geo Wiz")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding(1)
                    .font(.largeTitle)
                Image(systemName: "brain.head.profile")
                    .foregroundColor(Color.blue)
                    .font(.largeTitle)
                    .padding(1)
            }
            Image(gamedata.locations[gamedata.answer]) //Location image
                .resizable()
                .padding(2)
                .cornerRadius(13)
            HStack {
                Text("What Country?")
                    .font(.title)
                    .padding(2)
                    .foregroundColor(Color.white)
                Image(systemName: "globe.europe.africa")
                    .foregroundColor(Color.white)
                    .font(.title)
            }
            Spacer()
            ForEach(gamedata.numbers, id: \.self) { number in
                Image(gamedata.countries[number]) // Country flags
                    .onTapGesture {
                        let check = gamedata.flagTap(number)
                        if (check == 1) {
                            showAlert = true
                        }
                        refresh += 1
                    }
            }.border(Color.white, width: 0.3)
                .padding(4)
            Spacer()
            Text(gamedata.correct)
                .font(.title)
                .foregroundColor(OutPutColor(cell: gamedata.wrong))
                .fontWeight(.semibold)
            Spacer()
            Text("Score: " + String(gamedata.Score))
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
        }.background(Color.black.ignoresSafeArea())
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Game Over! \n Score: " + String(gamedata.Score) + "/21"), dismissButton: .default(
                    Text("New Game"), action: gamedata.newGame))
            }
    }
   
    func OutPutColor(cell: Bool) -> Color { //Function that outputs correct color for correct/wrong
        if (cell == true) {
            return .red
        }
        return .green
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
