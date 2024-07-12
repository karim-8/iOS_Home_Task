//
//  DetailedCharacterView.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 09/07/2024.
//



import SwiftUI

struct ContentView: View {

    // MARK:- VARIABLES
    @EnvironmentObject private var characterDetails: CharacterDetailedObject
    @Environment(\.presentationMode) var presentationMode
    let viewModel = DetailedCharacterViewModel()

    var body: some View {
            NavigationView {
                VStack{
                    // Vstack contains the image and the back button
                    VStack {
                        AsyncImage(url: URL(string: viewModel.getImageUrl(dataObj: characterDetails))) { image in
                            image.resizable()
                        } placeholder: {
                            Image("yassir_logo")
                        }
                            .cornerRadius(30)
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 400)
                            .frame(maxWidth: .infinity)
                            .edgesIgnoringSafeArea(.all)
                        Button(action: {
                            // Back to the home main screen
                            viewModel.popBackToHomeScreen(presentationMode: presentationMode)
                        }) {
                            HStack {
                                Image(systemName: "arrow.backward")
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .padding(.leading, 5)
                            }
                        }
                        .padding(.top, 20)
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

                    // Character Details
                    HStack {
                        VStack(alignment: .leading) {
                            HStack{
                                Text(viewModel.getCharacterName(dataObj: characterDetails))
                                    .font(.system(size: 20)).bold()
                                Spacer()
                                CircleInRectangleTextView(text: viewModel.getCharacterStatus(dataObj: characterDetails)).padding([.trailing], 20)
                            }
                            HStack {
                                Text(viewModel.getCharacterSpecies(dataObj: characterDetails))
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(red: 90/255.0, green: 90/255.0, blue: 90/255.0))

                                Text(viewModel.getCharacterGender(dataObj: characterDetails))
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                            }
                            HStack {
                                Text("Location : ")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black).bold()

                                Text(characterDetails.dataPerCharacter.location?.name ?? "Earth")
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
