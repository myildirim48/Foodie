//
//  OnboardingView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 17.06.2023.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var manager = OnboardingManager()
    @State private var currentTab = 0
    @State var showLogin : (Bool) -> Void
    
    var body: some View {
        ZStack {
            if !manager.items.isEmpty {
                TabView(selection: $currentTab) {
                    if currentTab == 0 {
                        OnboardingFirst
                            .tag(0)
                    }else {
                        ForEach(manager.items) { item in
                            VStack {
                                OnboardingInfoView(item: item)
                                    .tag(item.id)
                            }
                        }
                    }

                }
                .overlay(alignment: .bottom, content: {
                    OnboardingButton(double: 0.0) {
                        currentTab <= 2 ? currentTab += 1 : showLogin(true)
                    }
                })

                .edgesIgnoringSafeArea(.top)
                .animation(.easeInOut, value: currentTab)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                  .tabViewStyle(PageTabViewStyle())
            }
        }.onAppear {
                manager.load()
        }
        
    }
    
    var OnboardingFirst: some View {
        
        VStack {
            Image("onboarding1")
                .resizable()
                .frame(width: 450,height: 650)
                .mask(Rectangle())
            
            VStack {
                Text("Get Started.")
                    .font(.system(size: 35,weight: .heavy))
                    .padding(.top)
                
                Text("Order from your favourite restaurants and takeaways within the matter of seconds.")
                    .font(.system(size: 15, weight: .light))
                    .padding(.top,5)
                    .padding([.leading,.trailing], 40)
                Spacer()
                
            }.frame(width: 400, height: 350)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: .black, radius: 10, x: 0, y: 0)
                .offset(x: 0, y: -90)
            
            
        }
        .ignoresSafeArea(.all)
        
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView { _ in
            
        }
    }
}
