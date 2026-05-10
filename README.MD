# FakeCall — Apple Watch App

A discreet Apple Watch application that helps users escape meetings gracefully, without causing social awkwardness or drawing unwanted attention.

---

## Table of Contents

- [Overview](#overview)
- [Why Apple Watch?](#why-apple-watch)
- [Features](#features)
- [Out of Scope](#out-of-scope)
- [UI Structure & Screens](#ui-structure--screens)
- [Project Structure](#project-structure)
- [Technology Stack](#technology-stack)
- [Requirements](#requirements)
- [Installation](#installation)
- [Design Criteria](#design-criteria)
- [Authors](#authors)

---

## Overview

**FakeCall** is an Apple Watch application designed to solve a common social problem: leaving formal or uncomfortable meetings without interrupting the flow or calling attention to yourself. By simulating an incoming phone call, the app provides a natural and believable excuse to step away — all triggered discreetly from your wrist.

---

## App in Action

Here's a quick look at how FakeCall works:

![FakeCall Demo](/Fakecall-Cont/vid/Screen%20Recording%202026-05-10%20at%2014.43.09.mov)

---

## Why Apple Watch?

The Apple Watch is the ideal platform for this kind of app due to its:

- **Personal and discreet nature** — always on your wrist, no need to reach for your phone
- **Haptic feedback** — silent vibration alerts that only you can feel
- **Quick interactions** — minimal taps and swipes, no lengthy menus
- **Social subtlety** — glancing at a watch is far less intrusive than pulling out a phone

---

## Features

- **Simulated incoming call** — triggers a realistic fake call screen to justify stepping out
- **Haptic feedback** — the simulated call includes realistic haptic vibrations, making the alert discreet and personal
- **Accept or reject the fake call** — gives you full control over how the situation plays out
- **On-call screen** — after accepting, displays an active call screen until you choose to hang up
- **Minimalist contact management** — add a fake contact name and number to make the simulation more convincing
- **Configurable triggers** — customize the number of taps required to initiate the fake call

---

## Out of Scope

The following features are **intentionally not included** in this application:

- No real phone calls or external network communication
- No integration with calendar apps or meeting platforms (e.g. Google Calendar, Zoom)
- No support for devices other than Apple Watch
- No audio analysis or AI-based detection of ideal exit moments
- No multi-device or multi-account synchronization
- No artificial intelligence for social context interpretation
- No access to the device owner's real contacts list

---

## UI Structure & Screens

### Navigation Flow

```
[Black Screen / Idle View]
      |
      ├──> Tap (x times) ──> [Fake Call Screen]
      │                         ├──> Accept ──> [On-Call Screen]
      │                         │                └── Hang Up ──> [Black Screen]
      │                         └──> Reject ──> [Black Screen]
      │
      └──> Long Press ──> [Options / TabView]
                           |
                           ├──> [Contacts Screen] (tap contact → triggers Fake Call)
                           ├──> [Add Contact Screen]
                           └──> [Settings Screen]
```

### Screen Descriptions

| Screen | File | Description |
|---|---|---|
| **Idle / Black Screen** | <img src="/Fakecall-Cont/img/a.png" width="200"> | The app's resting state. Listens for tap gestures to trigger the fake call, or long press to open the menu. |
| **Fake Call Screen** | <img src="/Fakecall-Cont/img/Simulator Screenshot - Apple Watch Series 9 - 2026-05-10 at 15.09.53.png" width="200"> | Simulates a realistic incoming call with the selected contact's details. Options to accept or reject. |
| **On-Call Screen** | <img src="/Fakecall-Cont/img/Simulator Screenshot - Apple Watch Series 9 - 2026-05-10 at 15.11.16.png" width="200"> | Simulates an active call after accepting. Stays until the user taps Hang Up. |
| **Options / TabView** | <img src="/Fakecall-Cont/img/Simulator Screenshot - Apple Watch Series 9 - 2026-05-10 at 15.07.20.png" width="200"> <img src="/Fakecall-Cont/img/Simulator Screenshot - Apple Watch Series 9 - 2026-05-10 at 15.07.24.png" width="200"> <img src="/Fakecall-Cont/img/Simulator Screenshot - Apple Watch Series 9 - 2026-05-10 at 15.09.31.png" width="200"> <img src="/Fakecall-Cont/img/Simulator Screenshot - Apple Watch Series 9 - 2026-05-10 at 15.09.44.png" width="200">| Container for the three settings tabs: Contacts, Add Contact, and Settings. |

---

## Project Structure

```
FakeCall Watch App/
├── FakeCallApp.swift               # App entry point (@main)
├── Assets.xcassets                 # App icons and colors
│
├── Page/                           # Top-level screens
│   ├── BlackScreenView.swift       # Idle view, listens for tap gestures
│   ├── ChamadaView.swift           # Incoming call simulation
│   ├── OnCallView.swift            # Active call simulation
│   └── OptionsView.swift           # TabView container (contacts, add, settings)
│
├── Views/                          # Reusable SwiftUI components
│   ├── ContactoChamada/            # Components used in call screens
│   └── Options/                    # Components used in the settings tabs
│
└── Model/                          # Data models and persistence
    ├── ContactoModel.swift          # Codable struct for a contact
    ├── ContactosManage.swift        # Manages the saved contacts list
    ├── ConfigManage.swift           # Manages app configuration (e.g. tap count)
    └── ContactoSelected.swift       # Tracks the currently selected contact
```

---

## Technology Stack

| Category | Details |
|---|---|
| **UI Framework** | SwiftUI |
| **State Management** | Native patterns — `@State`, `@Binding`, `@StateObject` |
| **Data Persistence** | Local JSON storage via `FileManager` + `Codable` protocol |
| **Haptics** | `WKInterfaceDevice.current().play(_:)` for haptic feedback |
| **Animations** | Custom `GeometryEffect` (`ShakeAnimacao`) for UI feedback |

---

## Requirements

| Requirement | Minimum Version |
|---|---|
| **watchOS** | 10.0+ |
| **Xcode** | 15.0+ |
| **Swift** | 5.9+ |
| **Device** | Apple Watch Series 4 or later |

> **Note:** No iPhone companion app is required. FakeCall runs as a standalone watchOS application.

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Gnmoleiro/FakeCall.git
   ```
2. Open `FakeCall.xcodeproj` in Xcode
3. Select an Apple Watch simulator or a connected physical device as the run target
4. Build and run the project (`Cmd + R`)

> If running on a physical Apple Watch, ensure your device is paired and trusted in Xcode under **Window → Devices and Simulators**.

---

## Design Criteria

- **Simple and minimalist interface** — adapted to the Apple Watch's small screen real estate
- **Fast and discreet interactions** — every action requires as few taps as possible
- **UX-first approach** — designed with social context in mind, prioritising invisibility and ease of use
- **No unnecessary permissions** — the app does not request access to contacts, microphone, or any sensitive data

---

## License

This project was developed for academic purposes. All rights reserved by the authors.

---

## Authors

- **Daniel Ferro** — [RpVitrine](https://github.com/RpVitrine)
- **Guilherme Moleiro** — [@Gnmoleiro](https://github.com/Gnmoleiro)
