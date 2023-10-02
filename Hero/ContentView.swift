//
//  ContentView.swift
//  Hero
//
//  Created by Yusuf Can Sağlam on 27.09.2023.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            
            GalaxyOfStars()
                .blendMode(.hardLight)
            
            
            VStack {
                
                VStack {
                    Text("Login")
                            .font(.title)
                        .foregroundColor(Color.mint).opacity(0.9)
                        .padding()
                
                        
                    
                    Text("Hi Welcome back , you've been missed")
                        .foregroundColor(Color.purple).opacity(0.9)
                        .font(.caption)
                    
                }.padding()
                .padding(.top,-50)
          
                RiveViewModel(fileName: "hero").view()
                    .offset(y:-80)
                
                VStack(spacing: 15) {
                    TextField("E-mail", text: $email)
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.mint, lineWidth: 2))
                        .foregroundColor(.purple)
                        .accentColor(.purple)
                    
                    SecureField("Password", text: $password)
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.purple, lineWidth: 2))
                        .foregroundColor(.mint)
                        .accentColor(.mint)
                }.offset(y:-90)
                
                Button(action: {
                    
                    // Login action
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple.opacity(0.7))
                        .foregroundColor(.mint)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .shadow(radius: 10)
                        .padding()
                        .offset(y:-70)
                        
                }
                
                VStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                        .padding(.vertical,11)
                        .foregroundColor(Color.mint)
                    
                    Button(action: {
                        
                    }) {
                        Text("Sign Up")
                            .frame(width: 50)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.purple.opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .underline()
                            .padding(.vertical,-19)
                            .font(.footnote)
                            .bold()
                    }
                }.offset(y:-30)
                
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
