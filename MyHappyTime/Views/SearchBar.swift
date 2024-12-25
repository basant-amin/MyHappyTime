//
//  SearchBar.swift
//  MyHappyTime
//
//  Created by basant amin bakir on 18/12/2024.
//

import SwiftUI
struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                
                TextField( "Search", text: $text)
                    .font(.custom("Cairo-Medium", size: 16))
                    .padding(10)
                    .cornerRadius(10)
                    .accentColor(.blue)
            }
            .padding(.horizontal, 10)
        }
        .frame(height: 50)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.blue.opacity(0.5), lineWidth: 1)
        )
        .onTapGesture {
            withAnimation {
            }
        }
    }
}
