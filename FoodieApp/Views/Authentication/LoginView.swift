//
//  LoginView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 17.06.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack(alignment: .leading) {
//            Header
            
                Text("Log In to continnue")
                    .font(.system(size: 30, weight: .bold))
                    .padding(.bottom, 45)
            
                
//            Email password Fields
            CustomTextField(text: $email,
                            placeholder: Text("Email Address"),
                            imgName: "IconsEmail")
            .padding(.bottom)
                
            CustomTextField(text: $password, placeholder: Text("Password"), imgName: "IconsLock", isSecure: true)
                
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
            
//            Sign Up button
            
            
                Button {
                    //TODO: - Go to sign in page

                } label: {
                    Text("Don't have an account?")
                    +
                    Text(" Sign Up").bold()
                }.padding(32)

        }.padding(.horizontal,32)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
