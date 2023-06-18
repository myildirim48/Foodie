//
//  RegisterationView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 18.06.2023.
//

import SwiftUI

struct RegisterationView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @Environment(\.dismiss) var dissmis
    
    var body: some View {
        NavigationView {
            
            
            VStack(alignment: .leading) {
                //            Header
                
                Text("Create an account")
                    .font(.system(size: 30, weight: .bold))
                    .padding(.bottom, 45)
                //            Registration
                CustomTextField(text: $name, placeholder: "Name", imgName:.name )
                    .padding(.bottom)
                
                CustomTextField(text: $email, placeholder: "Email Address", imgName: .email)
                    .padding(.bottom)
                
                CustomTextField(text: $password, placeholder: "Password", imgName: .password, isSecure: true)
                    .padding(.bottom,32)
                
                //            Sign Up button
                Button {
                    
                } label: {
                    HStack{   Image("IconsEnvelope")
                            .foregroundColor(.white)
                        Text("Sign up with email")
                            .font(.system(size: 18,weight: .bold))
                            .foregroundColor(.white)
                    }.frame(width: 330, height: 50, alignment: .center)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                //            Divider
                
                HStack {
                    Rectangle()
                        .frame(width: 100, height: 1)
                        .foregroundColor(.secondary.opacity(0.5))
                    Text("Or Continue With")
                        .font(.system(size: 14,weight: .regular))
                    Rectangle()
                        .frame(width: 100, height: 1)
                        .foregroundColor(.secondary.opacity(0.5))
                }.padding(.vertical,36)
                
                //            Social Media Connect
                HStack(spacing: 20) {
                    SocialMediaButton(action: {
                        
                    }, imageName: .google)
                    SocialMediaButton(action: {
                        
                    }, imageName: .facebook)
                    SocialMediaButton(action: {
                        
                    }, imageName: .apple)
                }
                //            Login button
                
                Button {
                    dissmis()
                    
                } label: {
                    Text("Already an account?")
                    +
                    Text(" Log In").bold()
                    
                }
                .padding(.horizontal,52)
                .padding(.vertical,32)
                
                
                
            }.padding(.horizontal,32)
        }.navigationBarHidden(true)
    }
}

struct RegisterationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterationView()
    }
}
