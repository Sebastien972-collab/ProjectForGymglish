//
//  SingUpView.swift
//  MyBestFriends
//
//  Created by DAGUIN Sébastien on 11/05/2021.
//

import SwiftUI
struct SingUpView: View {
    @State var username = ""
    @State var password = ""
    @State var alertEmptyField = false
    @State var alertWrongField = false
    @State var errorMessage = ""
    var body: some View {
        ZStack {
            Color.pink.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                WelcomeText()
                UserImage()
                UsernameTextField(username: $username)
                PasswordTextField(password: $password)
                Spacer()
                ButtonSingIn(username: username, password: password, alertEmptyField: $alertEmptyField, alertWrongField: $alertWrongField, errorMessage: $errorMessage)
                    .padding()
            }
            .onTapGesture {
                hideKeyboard()
            }
            .alert(isPresented: $alertWrongField, content: {
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("ok")))
            })
        }
    }
}

struct SingUpView_Previews: PreviewProvider {
    
    static var previews: some View {
        SingUpView()
    }
}

struct WelcomeText: View {
    var body: some View {
        Text("Welcome").font(.largeTitle).fontWeight(.semibold).padding(.top, 50)
    }
}

struct UserImage: View {
    var body: some View {
        Image("gymglishlogo").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).clipped().clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).padding()
    }
}
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct ButtonSingIn: View {
    var username : String
    var password : String
    @Binding var alertEmptyField : Bool
    @Binding var alertWrongField : Bool
    @Binding var errorMessage : String
    @State var isPresented = false
    var body: some View {
        Button(action: {
            guard User.currentUser.username == username && User.currentUser.password == password else {
                alertWrongField = true
                errorMessage = "Your username or password is wrong"
                return
            }
            isPresented = true
        }, label: {
            Text("Sing In").foregroundColor(.white)
        }).frame(width: 300, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Color.blue).cornerRadius(50.0)
        .fullScreenCover(isPresented: $isPresented, content: {
            ListWebSite( listWebSiteisPresented: $isPresented)
        })
    }
}

struct UsernameTextField: View {
    let lightGreyColor = Color( red:239.0/255.0 , green: 243.0/255.0, blue: 244.0/255.0)
    @Binding var username : String
    var body: some View {
        VStack {
            Text("Username")
            TextField(" Username", text: $username).padding(.leading, 10).keyboardType(.namePhonePad)
        }.frame(width: 300, height: 60, alignment: .topLeading).background(lightGreyColor).cornerRadius(25.0)
    }
}

struct PasswordTextField: View {
    let lightGreyColor = Color( red:239.0/255.0 , green: 243.0/255.0, blue: 244.0/255.0)
    @Binding var password : String
    var body: some View {
        VStack {
            Text("Password")
            SecureField("Password", text: $password).padding(.leading, 10)
        }.frame(width: 300, height: 60, alignment: .topLeading).background(lightGreyColor).cornerRadius(25.0).padding()
    }
}
