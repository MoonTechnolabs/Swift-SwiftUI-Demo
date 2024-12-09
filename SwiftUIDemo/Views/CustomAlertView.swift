//
//  CustomAlertView.swift
//  SwiftUIDemo
//
//  Created by Vivek H on 23/07/24.
//

import SwiftUI

struct CustomAlertView: View {
    
    @State private var showCreateFolderView = false
    
    @State private var folderName : String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            Color(.black.withAlphaComponent(0.2)).ignoresSafeArea().onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                
                self.dismiss()
                
            }
            VStack {
                VStack {
                    VStack(alignment:.center,spacing: 30) {
                        
                        VStack(alignment:.center,spacing: 20) {
                            Text("Enter the name of the Folder").font(.system(size: 14,weight: .medium))
                            VStack {
                                TextField(LocalizedStringKey("Enter Folder Name"), text: $folderName)
                            }.padding(12).background(.white).overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color(.blue), lineWidth: 0.5)
                            }
                        }
                        Button {
//                            self.showCreateFolderView.toggle()
                            
                            self.dismiss()
                            
                        } label: {
                            Text("Create Folder").foregroundStyle(.white).font(.system(size: 16,weight: .bold))
                        }.padding(EdgeInsets(top: 15, leading: 60, bottom: 15, trailing: 60)).background(.blue).cornerRadius(6)
                    }.padding(EdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20)).cornerRadius(10)
                }.background(.white).cornerRadius(12).shadow(color: Color(UIColor(red: 75/255, green: 85/255, blue: 99/255, alpha: 0.1)), radius: 10,y:0)
            }.padding(25)
        }.background(.clear)
    }
}

#Preview {
    CustomAlertView()
}
