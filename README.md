# TodayOnlyTodoApp
# Overview

Today Only Todo is an offline-first iOS task manager built using SwiftUI and CoreData.
The app is designed around a single constraint: tasks only exist for the current day and automatically expire when a new day begins.

Users can optionally set a same-day expiration time per task.
If set, the app shows remaining time until expiration and automatically hides expired tasks.

# Overall Approach

The goal was to build a clean, reliable implementation focused on correctness, time handling, and maintainable architecture rather than feature count or UI complexity.

The app is built using:
SwiftUI for UI
* CoreData for local persistence (iOS 16 compatible)
* MVVM architecture
* Repository pattern for persistence abstraction
* Date abstraction layer for time-based logic and testability

Tasks are filtered based on:
* Whether they were created today
* Optional per-task expiration time

Local notifications are scheduled if incomplete tasks exist before the end of the day.

Unit tests cover core business logic like date filtering and expiration behavior.

# Architecture

The app follows a lightweight layered structure:
View → ViewModel → Repository → CoreData

* View handles UI rendering and user interaction
* ViewModel handles business logic and filtering rules
* Repository handles persistence and CoreData operations

This keeps business logic testable and persistence easily replaceable if needed.

# Key Decisions / Tradeoffs

CoreData vs SwiftData ->
CoreData was chosen because the app targets iOS 16, while SwiftData requires iOS 17+.

Filtering Instead of Deleting Expired Tasks ->
Expired tasks are filtered instead of deleted to prevent accidental data loss and simplify logic.

Date Abstraction ->
Time logic is abstracted using a DateProviding protocol to enable deterministic unit testing.

Scope Control ->
UI and animations were intentionally kept simple to prioritize product correctness and time-based behavior.

# What I Would Improve With More Time

* Widgets for quick task visibility
* App Intents / Siri integration
* More unit test coverage for edge time scenarios
* UI polish with animations and haptic feedback
* Background refresh improvements for notification accuracy

# Build Instructions

Open in Xcode 14+ 

Run on iOS 16+ simulator or device

No setup required.
