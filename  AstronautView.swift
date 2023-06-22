//
//   AstronautView.swift
//  Moon
//
//  Created by Boubacar sidiki barry on 22.06.23.
//

import SwiftUI

struct _AstronautView: View {
    let astronaut: Astronaut

        var body: some View {
            ScrollView {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()

                    Text(astronaut.description)
                        .padding()
                }
            }
            .background(.darkBackground)
            .navigationTitle(astronaut.name)
            .navigationBarTitleDisplayMode(.inline)
        }
}

struct _AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        _AstronautView(astronaut: astronauts["aldrin"]!)
                   .preferredColorScheme(.dark)
    }
}
