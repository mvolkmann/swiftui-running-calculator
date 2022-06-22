import SwiftUI

struct Splash: View {
    let instructions = "Tap the button for the value to calculate (pace, time, or distance) and enter the other two values."

    var body: some View {
        NavigationView {
            VStack {
                Text(instructions)
                    .font(.system(size: 14))
                NavigationLink("Go! 🏃‍♀️🏃🏾🏃‍♂️") {
                    MainView()
                }
                .font(.system(size: 24))
                .foregroundColor(.yellow)
            }
            .navigationBarHidden(true)
        }
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
