//
//  NoItemsView.swift
//  ToCodeList
//
//  Created by David Cartwright on 2025-01-23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? You want to code? Add a bunch of items to your list and get them done!")
                    .padding(.bottom, 20)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add something ⌨️")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.5) : Color.accentColor.opacity(0.5),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )

            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear {
                addAnimation()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Title")
    }
    
    func addAnimation() {
        guard !animate else {return} // making sure .toggle is not called twice
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationStack {
        NoItemsView()
    }
}
