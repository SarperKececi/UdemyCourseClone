import SwiftUI

struct LoginScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingAlert: Bool = false
    
    @State private var isLoginSuccessful: Bool = false // Ekledik

    var body: some View {
      // NavigationView kullanıyoruz
            VStack {
                Text("Giriş Ekranı")
                    .font(.largeTitle)
                    .padding()

                TextField("E-posta", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Şifre", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                NavigationLink(destination: CourseScreen(), isActive: $isLoginSuccessful) { EmptyView() }

                Button("Giriş Yap.") {
                    if email == "test@test.com" && password == "123" {
                        UserDefaults.standard.set(true, forKey: "isLogin")
                        isLoginSuccessful = true // Yönlendirme işlemi
                    } else {
                        showingAlert = true // Hatalı giriş uyarısı göster
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
        
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hata"), message: Text("Mail veya şifre hatalı"), dismissButton: .default(Text("Tamam")))
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

