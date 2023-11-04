import SwiftUI
import Alamofire
import Kingfisher

struct CourseScreen: View {
    @State private var courses: [CourseModel] = []
    @State private var selection: Bool = false

    var body: some View {
        ScrollView {
            Text("Courses")
                .font(.title)
                .bold()
                .padding()
            LazyVStack(spacing: 10) {
                NavigationLink(destination: LoginScreen(), isActive: $selection) {
                    EmptyView()
                }

                ForEach(courses, id: \.name) { course in
                    HStack {
                        KFImage(URL(string: course.image))
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(8)
                        
                        Text(course.name)
                            .font(.headline)
                            .foregroundColor(.blue)
                        
                        Spacer()
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                }
                Spacer()

                Button("LogOut") {
                    UserDefaults.standard.set(false, forKey: "isLogin")
                    selection = true
                }
            }
        }
        .onAppear {
            fetchCourse()
        }
    }

    func fetchCourse() {
        let request = AF.request("https://iosacademy.io/api/v1/courses/index.php")
        
        request.responseDecodable(of: [CourseModel].self) { response in
            if let courses = response.value {
                self.courses = courses
            }
        }
    }
}

struct CourseScreen_Previews: PreviewProvider {
    static var previews: some View {
        CourseScreen()
    }
}

