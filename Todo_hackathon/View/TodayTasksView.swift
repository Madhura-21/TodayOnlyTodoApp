import SwiftUI

struct TodayTasksView: View {
    
    @StateObject var viewModel: TodayTasksViewModel
    @State private var taskTitle = ""
    @State private var taskHasExpiry = false
    @State private var taskExpiryTime = Date()
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                AddTaskInputView(
                    text: $taskTitle,
                    hasExpiry: $taskHasExpiry,
                    expiryTime: $taskExpiryTime
                ) {
                    
                    viewModel.addTask(
                        title: taskTitle,
                        expirationDate: taskHasExpiry ? taskExpiryTime : nil
                    )
                    
                    taskTitle = ""
                    taskHasExpiry = false
                }
                if viewModel.tasks.isEmpty {
                    VStack(spacing: 10) {
                        Image(systemName: "checkmark.circle")
                            .font(.largeTitle)
                        Text("No tasks today")
                    }
                    .padding()
                } else {
                    List {
                        ForEach(viewModel.tasks, id: \.objectID) { task in
                            TaskRowView(task: task) {
                                viewModel.toggleTask(task)
                            }
                        }
                    }
                }
                Spacer()
                
                Button("Trigger Demo Notification") {
                    NotificationManager.shared.scheduleDemoNotification10Sec()
                }
                .padding()
            }
            .navigationTitle("Today")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
