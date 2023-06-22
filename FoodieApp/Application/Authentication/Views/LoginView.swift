//
//  LoginView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 17.06.2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @EnvironmentObject var session: SessionManager
    var body: some View {
        NavigationView {

        VStack(alignment: .leading) {
            //            Header
            
            Text("Log In to continnue")
                .font(.system(size: 30, weight: .bold))
                .padding(.bottom, 45)
            
            //            Email password Fields
            CustomTextField(text: $authViewModel.email,
                            placeholder: "Email Address",
                            imgName: .email)
            .padding(.bottom)
            
            CustomTextField(text: $authViewModel.password, placeholder: "Password", imgName: .password, isSecure: true)
            
            //            Forgot password link test
            HStack {
                Spacer()
                
                NavigationLink {
                    //                    ResetPasswordView(email: $email)
                } label: {
                    Text("Forgot password?")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                        .padding([.top,.bottom])
                }
                
            }
            //            Login Button
            
            Button {
                authViewModel.login { isUser in
                    print(isUser)
                    isUser ? session.signIn() : session.logOut()
                }
            } label: {
                Text("Login")
                    .font(.system(size: 18,weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50, alignment: .center)
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
            
            //            Sign Up button

            NavigationLink {
                RegisterationView()
                    .environmentObject(authViewModel)
            } label: {
                Text("Don't have an account?")
                +
                Text(" Sign Up").bold()
                
            }
            .foregroundColor(.black)
            .padding(32)
            
        }.overlay(content: {
            if authViewModel.showLoading {
                ProgressView()
            }
        })
        .padding(.horizontal,32)
        }.navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
