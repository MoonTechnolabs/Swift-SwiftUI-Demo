//
//  SettingListingView.swift
//  SwiftUIDemo
//
//  Created by Vivek H on 23/07/24.
//

import SwiftUI

class ExpandableView : ObservableObject {
    
    @Published var selectedIndex : Set<Int> = []
}

struct SettingListingView: View {
    @StateObject var settings = ExpandableView()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 6){
            HStack(alignment:.center,spacing: 20) {
                Button {
                    self.dismiss()
                } label: {
                    Image(.icBack)
                }.padding(.leading,20)
                Text("Settings").font(.headline)
                Spacer()
            }.frame(height: 50).clipped().roundedCorner(20, corners: [.bottomLeft, .bottomRight])
            
            List {
                Section(header: TaskSection(headerTitle: "Account", sectionIndex: 0)) {
                    if settings.selectedIndex.contains(0) {
                        TaskRow(image: "ic_profile", title: "Edit profile")
                        TaskRow(image: "ic_privacy", title: "security")
                        TaskRow(image: "ic_notification", title: "Notifications")
                        TaskRow(image: "ic_lock", title: "Privacy")
                    }
                }

                Section(header: TaskSection(headerTitle: "Support & About", sectionIndex: 1)) {
                    if settings.selectedIndex.contains(1) {
                        TaskRow(image: "ic_card", title: "My Subscribtion")
                        TaskRow(image: "ic_question", title: "Help & Support")
                        TaskRow(image: "ic_terms", title: "Terms and Policies")
                    }
                }

                Section(header: TaskSection(headerTitle: "Cache & cellular", sectionIndex: 2)) {
                    if settings.selectedIndex.contains(2) {
                        TaskRow(image: "ic_delete", title: "Free up space")
                        TaskRow(image: "ic_data_saver", title: "Data Saver")
                    }
                }
                
                Section(header: TaskSection(headerTitle: "Actions", sectionIndex: 3)) {
                    if settings.selectedIndex.contains(3) {
                        TaskRow(image: "ic_flag", title: "Report a problem")
                        TaskRow(image: "ic_people_group", title: "Add account")
                        TaskRow(image: "mdi_logout", title: "Log out")
                    }
                }
            }.listStyle(.plain).listSectionSeparator(.hidden).background(.gray.opacity(0.05)).onTapGesture {
                
            }
        }.environmentObject(settings).navigationBarBackButtonHidden().toolbar(.hidden, for: .navigationBar)
    }
}

struct TaskRow: View {
    
    var image: String
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(image).resizable().frame(width: 20,height: 20).padding(5)
                Text(title)
                    .font(.footnote).fontWeight(.medium)
                Spacer()
            }
        }
        .padding(EdgeInsets(
            top: 6,
            leading: 12,
            bottom: 6,
            trailing: 12))
        .foregroundColor(.black)
        .background(.clear)
        .listRowBackground(
            RoundedRectangle(cornerRadius: 6, style: .circular)
                .background(.clear)
                .foregroundColor(.white)
                .padding(
                    EdgeInsets(
                        top: 4,
                        leading: 20,
                        bottom: 4,
                        trailing: 20
                    )
                )
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .clipped()
        .listRowSeparator(.hidden)
        .animation(.easeIn, value: true)
    }
}

struct TaskSection: View {
    
    var headerTitle: String
    var sectionIndex : Int
    
    @EnvironmentObject var settings: ExpandableView
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(content: {
                    Text("\(self.headerTitle)")
                        .font(.footnote).fontWeight(.medium)
                        .accessibilityAddTraits(.isHeader)
                })
                Spacer()
                Button(action: {
                    withAnimation(.bouncy) {
                        if settings.selectedIndex.contains(sectionIndex) {
                            settings.selectedIndex.remove(sectionIndex)
                        } else {
                            settings.selectedIndex.insert(sectionIndex)
                        }
                    }
                    
                }, label: {
                    Image("ic_expand").rotationEffect(.degrees(settings.selectedIndex.contains(sectionIndex) ? -180 : 0))
                    
                })
            }
            .font(.headline)
        }
        .padding()
        .clipped()
        .foregroundColor(.black)
        .background(.gray.opacity(0.1))
        .listRowSeparator(.hidden)
        .cornerRadius(6)
        
    }
}

#Preview {
    SettingListingView()
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundedSquareCorner: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.addRect(CGRect(x: 0.01*width, y: 0.01*height, width: 0.98*width, height: 0.98*height))
        return path
    }
}

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
