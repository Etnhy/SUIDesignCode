//
//  AccountView.swift
//  SUIDesignCode
//
//  Created by Evhenii Mahlena on 01.06.2022.
//

import SwiftUI

struct AccountView: View {
    
    @State var isDelete: Bool = false
    @State var isPined:  Bool = false
    
    var body: some View {
        NavigationView {
            List {
                profile     /*  Mark - Profile   */
                
                menu        /*  Mark - Menu      */
                
                links       /*  Mark - Links     */
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        } // Navigation View
    }
    
    // MARK: -  Profile
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.largeTitle)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    Image(systemName: "hexagon")
                        .symbolVariant(.fill)
                        .foregroundColor(.pink)
                        .font(.system(size: 200))
                        .offset(x: -50, y: -100)
                )
            Text("Evhenii Mahlena")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.large)
                Text("Ukraine")
                    .foregroundColor(.secondary)
            }
        } // VSTACK
        .frame(maxWidth: .infinity)
        .padding()
        
    }
    
    // MARK: - Menu
    
    var menu: some View {
        Section {
            NavigationLink(destination: ContentView()) {
                Label("Settings", systemImage: "gear")
            }
            
            NavigationLink { Text("Billing") } label:  {
                Label("Billing", systemImage: "creditcard")
            }
            
            NavigationLink { ContentView() } label: {
                Label("Help", systemImage: "questionmark")
            }
            
        } /* Section where: Settings,Billing,Help */
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
        
    }
    
    // MARK: - Links
    var links: some View {
        Section {
            if !isDelete {
                Link(destination: URL(string: "https://www.apple.com")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading , allowsFullSwipe: true) {
                    Button { isDelete = true } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    pinButton       /* Mark - PinButton */
                }
            }
            Link(destination: URL(string: "https://www.youtube.com")!) {
                HStack {
                    Label("YouTube", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions {
                pinButton           /* Mark - PinButton */
            }
        }   /* Section where "Website" */
        
        .listRowSeparator(.hidden)
        .accentColor(.primary)
    }
    // MARK: - PinButton
    var pinButton: some View {
        Button { isPined.toggle() } label: {
            if isPined {
                Label("Unpin", systemImage: "pin.slash")
            } else {
                Label("Pin", systemImage: "pin")
            }
        }
        .tint(isPined ? .gray : .yellow)

    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
