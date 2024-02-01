//
//  DetailView.swift
//  scrumdinger
//
//  Created by Liliana Popa on 29.01.2024.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var editingScrum = DailyScrum.emptyScrum

    @State private var isPresentingEditView = false
    var body: some View {
        List{
            Section(header: Text("Meeting Info")){
                
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                    .foregroundColor(.accentColor)
                }
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(7)
                    
                }
            }
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees){ attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar{
            Button("Edit"){
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView){
            NavigationStack {
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            Button("Cancel")
                            {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction)
                        {
                            Button("Done"){
                                
                                isPresentingEditView = false
                                scrum = editingScrum
                            }
                        }
                    }
            }
        }
    }
}

#Preview {

    NavigationStack {
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}