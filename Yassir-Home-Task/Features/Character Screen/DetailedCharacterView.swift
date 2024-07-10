//
//  DetailedCharacterView.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 09/07/2024.
//



import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationView {
                VStack{
                    // Vstack contains the image and the back button
                    VStack {
                        Image("yassir_logo")
                            .resizable()
                            .cornerRadius(30)
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 400)
                            .frame(maxWidth: .infinity)
                            .edgesIgnoringSafeArea(.all)
                        Button(action: {
                                // Action
                        }) {
                            HStack {
                                Image(systemName: "arrow.backward")
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .padding(.leading, 10)
                            }
                        }
                        .padding(.top, 10)
                        .padding(.leading, 5)
                        .offset(y: -400)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()

                    }.background(Color.white)
                      .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 0,
                      maxHeight: 400,
                      alignment: .top)
                      .cornerRadius(30)
                      .edgesIgnoringSafeArea(.all)

                    HStack {
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Zephyr")
                                    .font(.system(size: 20)).bold()

                                Spacer()

                                CircleInRectangleTextView(text: "Status").padding([.trailing], 20)
                            }

                            HStack {
                                Text("Elf")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(red: 90/255.0, green: 90/255.0, blue: 90/255.0))

                                Text(".  Male")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                            }

                            HStack {
                                Text("Location : ")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black).bold()

                                Text("Earth")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(red: 90/255.0, green: 90/255.0, blue: 90/255.0))
                            }.padding(.top, 15)


                        }

                        Spacer()

                    }

                    .background(Color.white)
                    .padding(.horizontal)
                    Spacer()
                }.background(Color.white)
            }
            .cornerRadius(30)
            .navigationBarHidden(true)
            .statusBar(hidden: false)
            .edgesIgnoringSafeArea(.all)
    }
}



struct CircleInRectangleTextView: View {
    let text: String
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 97/255.0, green: 203/255.0, blue: 244/255.0))
                .frame(width: 60, height: 25)
                .cornerRadius(30)
                .overlay(
                    Text(text)
                        .foregroundColor(.black).font(.system(size: 12))
                )
        }
    }
}
