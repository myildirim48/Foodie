//
//  RegisterationView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 18.06.2023.
//

import SwiftUI

struct RegisterationView: View {
    @EnvironmentObject private var viewModel: AuthenticationViewModel
    @EnvironmentObject var session: SessionManager
    @Environment(\.dismiss) var dissmis
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading) {
                //            Header
                
                Text("Create an account")
                    .font(.system(size: 30, weight: .bold))
                    .padding(.bottom, 45)
                
                //            Registration
                CustomTextField(text: $viewModel.name, placeholder: "Name", imgName:.name )
                    .padding(.bottom)
                
                CustomTextField(text: $viewModel.email, placeholder: "Email Address", imgName: .email)
                    .padding(.bottom)
                
                CustomTextField(text: $viewModel.password, placeholder: "Password", imgName: .password, isSecure: true)
                    .padding(.bottom,32)
                
                //            Sign Up button
                Button {
                    viewModel.signIn { userLoggedIn in
                        userLoggedIn ? session.signIn() : session.logOut()
                    }
                } label: {
                    HStack{
                        Image("IconsEnvelope")
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
                        .frame(height: 1)
                        .foregroundColor(.secondary.opacity(0.5))
                    Text("Or Continue With")
                        .font(.system(size: 12,weight: .regular))
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.secondary.opacity(0.5))
                }.padding(.vertical)
                
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
                
            }.overlay(content: {
                if viewModel.showLoading {
                    ProgressView()
                }
            }).padding(.horizontal,32)
        }.navigationBarHidden(true)
    }
}

struct RegisterationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterationView()
    }
}
