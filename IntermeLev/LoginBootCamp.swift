//
//  LoginBootCamp.swift
//  IntermeLev
//
//  Created by MacBook on 07.07.2022.
//

import SwiftUI

struct LoginBootCamp: View {
    @Environment(\.openURL) var openURL
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                
                HStack {
                    
                    Image(systemName: "person.crop.circle.badge.plus")
                        .foregroundColor(.blue)
                        .font(.title)
                        .padding(.top, 35)
                    
                    VStack(alignment: .leading) {
                        Text("Username")
                            .foregroundColor(.gray)
                            .bold()
                            .font(.title2)
                        TextField("Username", text: $username)
                            .textFieldStyle(.roundedBorder)
                            .font(Font.system(size: 30))
                    }
                }.padding(.bottom)
                
                HStack {
                    
                    Image(systemName: "key.fill")
                        .foregroundColor(.blue)
                        .font(.title)
                        .padding(.top, 35)
                    VStack(alignment: .leading) {
                        Text("Password")
                            .foregroundColor(.gray)
                            .bold()
                            .font(.title2)
                        TextField("Password", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .font(Font.system(size: 30))
                    }
                }
                Text("Forget Password?")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
                
                Spacer()
                Button("Login".uppercased()) {
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.black)
                .background(
                    Color(hue: 0.535, saturation: 0.595, brightness: 0.92))
                .font(.title .bold())
                .cornerRadius(.infinity)
                
                Text("Or sign up using your accounts")
                    .foregroundColor(.blue)
                    .font(.title3)
                    .bold()
                
                HStack(spacing: 20) {
                    Button(action: {
                        openURL(URL(string: "facebook.com")!) // <- Add your link here
                    }, label: {
                        Image(systemName: "link.circle.fill") // <- Change icon to your preferred one
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                    })
                    
                    Button(action: {
                        openURL(URL(string: "github.com")!) // <- Add your link here
                    }, label: {
                        Image(systemName: "arrowshape.turn.up.forward.circle.fill") // <- Change icon to your preferred one
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                    })
                    
                    Button(action: {
                        openURL(URL(string: "google.com")!) // <- Add your link here
                    }, label: {
                        Image(systemName: "network") // <- Change icon to your preferred one
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.red)
                    })
                }
                .padding()
                Spacer()
                VStack(spacing: 20) {
                    Text("Or sign up using our page")
                        .foregroundColor(.black)
                    Text("Sign Up".uppercased())
                        .foregroundColor(.green)
                        .font(.title3)
                        .bold()
                }
            }.padding()
        }
    }
    //    func textFieldText(title: String) -> TextField {
    //        return TextField(title, text: $keyToBindWith)
    //    }
}

struct LoginBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        LoginBootCamp()
    }
}
