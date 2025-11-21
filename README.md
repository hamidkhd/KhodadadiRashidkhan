# R&DD & I&T Assignment – Software Engineering 2
Group: KhodadadiRashidkhanMofrad

Members: Hamidreza Khodadadi, Mohammad Rashid Khan Mofrad

Professor: Prof. Matteo G. Rossi

Description: Unified repository for the R&DD (RASD and DD) and I&T (Implementation and Test, Acceptance Test) assignments of the Best Bike Paths (BBP) project. Includes analysis, design, implementation, and testing artifacts developed during the Software Engineering 2 course.


# Best Bike Paths – RASD & DD Checklist
Team: Mohammad & Hamid

> Tip: Each of you can filter by your name and tick items as you complete them.  
> Mark tasks as done by changing `[ ]` to `[x]`.

---

## 0. Shared Setup (before deep work)

- [ ] **Both** – Create private git repo, invite professor, add both members.
- [ ] **Both** – Create folders: `RASD/`, `DD/`, `DeliveryFolder/`.
- [ ] **Both** – Decide on:
  - [ ] Naming conventions for requirements (e.g. `FR-TR-01`, `FR-PA-01`).
  - [ ] UML style (tools, notation, colours, legends).
  - [ ] How you log hours for “Effort spent” sections.
- [ ] **Both** – Draft a first **domain vocabulary** (Trip, Path, Segment, Status, Obstacle, User, etc.).
- [ ] **Both** – Sketch a **shared domain model** (even on paper) before starting RASD.

---

## 1. RASD Checklist

### 1.1 Front page & general

- [ ] **Mohammad** – Draft FRONT PAGE (title, version, names, release date).
- [ ] **Hamid** – Add “Use of Generative AI tools” subsection as required.
- [ ] **Both** – Check formatting, fonts, and numbering are consistent.

### 1.2 Section 1 – INTRODUCTION

#### Mohammad

- [ ] Write **1.A Purpose** (goals of BBP and project).
- [ ] Write **1.B Scope** part related to:
  - [ ] Recording personal trips.
  - [ ] Route request and visualization (origin–destination).
  - [ ] Weather enrichment of trip data.
- [ ] Write **1.F Document Structure** (short description of sections).

#### Hamid

- [ ] Write **1.B Scope** part related to:
  - [ ] Manual path insertion & publishable info.
  - [ ] Automated mode & confirmation.
- [ ] Draft **1.C Definitions, Acronyms, Abbreviations**.
- [ ] Draft **1.E Reference Documents**.
- [ ] Maintain **1.D Revision history** table for RASD.

#### Both

- [ ] Review the whole Section 1 for consistent terminology.
- [ ] Ensure scope matches the assignment of a 2‑person group.

---

### 1.3 Section 2 – OVERALL DESCRIPTION

#### Mohammad – “Trips & Routing”

- [ ] Write scenarios for:
  - [ ] Recording a trip and viewing statistics.
  - [ ] Requesting bike paths between origin and destination.
- [ ] Identify high‑level **product functions** for:
  - [ ] Trip recording and storage.
  - [ ] Trip statistics.
  - [ ] Route computation & map visualization.
  - [ ] Weather enrichment for trips.
- [ ] Draw state diagram for **Trip lifecycle**.

#### Hamid – “Path Data & Automated Acquisition”

- [ ] Write scenarios for:
  - [ ] Manual path insertion & editing (status + obstacles).
  - [ ] Automated acquisition with sensors and user confirmation.
- [ ] Identify high‑level **product functions** for:
  - [ ] Manual path insertion.
  - [ ] Automated data capture (GPS + sensors).
  - [ ] Confirmation/correction of detected potholes / issues.
- [ ] Draw state diagram for **Path Information lifecycle** (draft → confirmed → publishable).

#### Domain model (shared)

- [ ] **Hamid (lead)** – Draft classes for Path, Segment, Status, Obstacle, SensorData, PublishableInfo.
- [ ] **Mohammad (lead)** – Draft classes for Trip, TripStatistics, WeatherData, Route, User, MapView.
- [ ] **Both** – Merge into a single **domain class diagram** and:
  - [ ] Remove duplicates / rename consistently.
  - [ ] Check that every scenario entity appears in the model.

#### User characteristics & assumptions

- [ ] **Hamid** – Write **User characteristics** section.
- [ ] **Mohammad** – Add device and usage details relevant to trip and routing features.
- [ ] **Mohammad** – Write assumptions about connectivity, map/route service, weather service.
- [ ] **Hamid** – Write assumptions about sensors, GPS accuracy, and device limits.

---

### 1.4 Section 3 – SPECIFIC REQUIREMENTS

#### 3.A External Interface Requirements

- [ ] **Mohammad** – Describe **User Interfaces** for:
  - [ ] Trip recording (start/stop, live view).
  - [ ] Trip details (stats + weather).
  - [ ] Route search & map view.
- [ ] **Hamid** – Describe **User Interfaces** for:
  - [ ] Manual path insertion/editing.
  - [ ] Automated mode confirmation screen.
- [ ] **Hamid** – Describe **Hardware Interfaces** (GPS, accelerometer, gyroscope).
- [ ] **Mohammad** – Describe **Software Interfaces** (map service, weather service).
- [ ] **Mohammad** – Describe **Communication Interfaces** (mobile ↔ backend, services).

#### 3.B Functional Requirements, Use Cases, Diagrams

- [ ] **Mohammad** – Draw use case diagram for:
  - [ ] Trip recording and statistics.
  - [ ] Route request & visualization.
- [ ] **Hamid** – Draw use case diagram for:
  - [ ] Manual path insertion/editing.
  - [ ] Automated acquisition and confirmation.

- [ ] **Mohammad** – Write detailed use cases:
  - [ ] UC: Record Trip.
  - [ ] UC: View Trip History.
  - [ ] UC: View Trip Details (with weather).
  - [ ] UC: Request Bike Paths (origin–destination).
- [ ] **Hamid** – Write detailed use cases:
  - [ ] UC: Add Path Manually.
  - [ ] UC: Edit Path / Update Status.
  - [ ] UC: Enable Automated Mode.
  - [ ] UC: Confirm/Reject Detected Issues.

- [ ] **Mohammad** – Make sequence/activity diagrams for his use cases.
- [ ] **Hamid** – Make sequence/activity diagrams for his use cases.

- [ ] **Hamid (owner)** – Create mapping table: **Use cases ↔ Functional Requirements**.
- [ ] **Mohammad** – Provide requirement IDs and description for his area.

#### 3.C–3.E Non‑functional & constraints

- [ ] **Mohammad** – Write **Performance Requirements** (routes, stats, map).
- [ ] **Hamid** – Write performance constraints for sensor processing.
- [ ] **Hamid** – Write **Design Constraints** (standards, sensor/hardware limitations).
- [ ] **Mohammad** – Write remaining design constraints if any.
- [ ] **Mohammad** – Draft **Reliability & Availability**.
- [ ] **Hamid** – Draft **Security & Privacy** (especially location data).
- [ ] **Mohammad** – Draft **Maintainability & Portability**.

---

### 1.5 Section 4 – FORMAL ANALYSIS USING ALLOY

- [ ] **Hamid** – Write intro on goals of the Alloy model.
- [ ] **Hamid** – Define core signatures: Path, Segment, Status, Obstacle, User.
- [ ] **Mohammad** – Define Trip, Route, WeatherData, TripStatistics signatures.
- [ ] **Hamid** – Add facts & assertions about path statuses, obstacles, publishable info.
- [ ] **Mohammad** – Add facts & assertions about trip–route consistency and weather.
- [ ] **Both** – Run Alloy, capture example worlds and check results.
- [ ] **Mohammad** – Insert screenshots / textual results and explain them.

### 1.6 Sections 5–6 – Effort & References

- [ ] **Hamid** – Compile **Effort spent** table for RASD using your time logs.
- [ ] **Mohammad** – Review and confirm hours.
- [ ] **Hamid** – Finalize **References** section.

---

## 2. DD Checklist

### 2.1 Section 1 – INTRODUCTION

- [ ] **Mohammad** – Draft Purpose, Scope, and Document Structure for DD.
- [ ] **Hamid** – Fill Definitions, Revision History, and References.
- [ ] **Both** – Ensure consistency with RASD terminology.

---

### 2.2 Section 2 – ARCHITECTURAL DESIGN

#### Overview & component view

- [ ] **Mohammad** – Draw high‑level architecture diagram:
  - [ ] Mobile App, Backend, DB, Map/Routing service, Weather service.
- [ ] **Hamid** – Ensure path & sensor components are visible in the architecture.

- [ ] **Mohammad** – Detail components for:
  - [ ] TripRecordingService.
  - [ ] StatsService.
  - [ ] RoutingService / RoutePlanner.
  - [ ] WeatherServiceAdapter.
- [ ] **Hamid** – Detail components for:
  - [ ] PathManagementService.
  - [ ] SensorDataCollector.
  - [ ] PotholeDetectionEngine.
  - [ ] ConfirmationService.

#### Deployment view

- [ ] **Mohammad** – Draw deployment diagram with:
  - [ ] Mobile device node.
  - [ ] Backend node.
  - [ ] External services nodes.
- [ ] **Hamid** – Add notes for sensor data flow and upload.

#### Runtime view (sequence diagrams)

- [ ] **Mohammad** – Sequence diagrams for:
  - [ ] “Record Trip & Store Statistics.”
  - [ ] “Request Routes & Display Ranked Paths.”
- [ ] **Hamid** – Sequence diagrams for:
  - [ ] “Manual Path Insertion & Publication.”
  - [ ] “Automated Mode: Collect, Detect, Confirm, Update Path Info.”

#### Component interfaces & patterns

- [ ] **Mohammad** – Specify interfaces of Trip & Routing related services.
- [ ] **Hamid** – Specify interfaces of Path & Sensor related services.
- [ ] **Mohammad** – Describe chosen architectural styles (client‑server, layered).
- [ ] **Hamid** – Describe design patterns used (e.g. MVC, Repository, Service layer).
- [ ] **Both** – Cross‑check interfaces for consistent data types and IDs.

---

### 2.3 Section 3 – USER INTERFACE DESIGN

- [ ] **Mohammad** – Detailed UI flows / sketches for:
  - [ ] Recording trip, trip list.
  - [ ] Trip details with stats & weather.
  - [ ] Route search and map view.
- [ ] **Hamid** – Detailed UI flows / sketches for:
  - [ ] Manual path entry/editing.
  - [ ] Automated mode configuration.
  - [ ] Confirmation of detected issues.
- [ ] **Both** – Ensure DD’s UI is consistent with (and extends) RASD UI description.

---

### 2.4 Section 4 – REQUIREMENTS TRACEABILITY

- [ ] **Hamid (owner)** – Build table mapping:
  - [ ] RASD functional requirements → DD components / diagrams.
  - [ ] RASD non‑functional requirements → DD architectural decisions.
- [ ] **Mohammad** – Add entries for his trip/routing/weather requirements.
- [ ] **Both** – Verify every RASD requirement appears in the traceability matrix.

---

### 2.5 Section 5 – IMPLEMENTATION, INTEGRATION AND TEST PLAN

- [ ] **Mohammad** – Propose implementation order for:
  - [ ] Core domain & DB.
  - [ ] Trip recording & storage.
  - [ ] Routing & map.
  - [ ] Weather integration.
- [ ] **Hamid** – Propose implementation order for:
  - [ ] Path management.
  - [ ] Sensor data collection.
  - [ ] Pothole detection & confirmation workflows.
- [ ] **Hamid (lead)** – Merge into a single integration plan (which feature first, what to test).
- [ ] **Mohammad** – Add integration & system test ideas for trip/routing.
- [ ] **Hamid** – Add tests for manual/automated path info & confirmation.

---

### 2.6 Sections 6–7 – Effort & References

- [ ] **Mohammad** – Compile **Effort spent** table for DD.
- [ ] **Hamid** – Review and confirm hours.
- [ ] **Hamid** – Finalize **References** section for DD.

---

## 3. Final Shared Checks (before submission)

- [ ] **Both** – RASD: full read‑through, fix inconsistencies and broken references.
- [ ] **Both** – DD: full read‑through, ensure it matches RASD requirements and terminology.
- [ ] **Both** – Confirm “Use of Generative AI” descriptions are present in both documents.
- [ ] **Both** – Export final PDFs as `RASDv1.pdf` and `DDv1.pdf` into `DeliveryFolder/`.
- [ ] **Both** – Push everything to main branch before deadlines.


