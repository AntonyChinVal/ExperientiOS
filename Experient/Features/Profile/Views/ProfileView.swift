//
//  ProfileView.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var profile = ProfileViewModel()

    var body: some View {
        Text(profile.greeting)
            .font(AppTheme.Typography.body1)
            .navigationTitle("Profile")
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ProfileViewModel())
            .preferredColorScheme(.light)
    }
}
