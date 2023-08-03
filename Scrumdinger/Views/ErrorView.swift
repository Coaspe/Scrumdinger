//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by 이우람 on 2023/08/02.
//

import SwiftUI

/// With the @Environment property wrapper, you can read a value that the view’s environment stores,
/// such as the view’s presentation mode, scene phase, visibility, or color scheme.
/// In this case, you’ll access the view’s dismiss structure and call it like a function to dismiss the view.
///
/// dismiss is a structure. You can call a structure like a function if it includes callAsFunction().
struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello, World!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError: Error {
        case errorRequired
    }
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired, guidance: "You can safely ignore this error")
    }
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
