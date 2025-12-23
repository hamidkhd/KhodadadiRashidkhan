//-----------
// Signatures
//-----------

open util/integer
open util/temporal

// Registered cyclist of the BBP platform
sig Cyclist {
    var trips  : set Trip,
    var paths  : set Path,
    var issues : set DetectedIssue
}

// Basic piece of infrastructure
sig PathSegment {}

// Status assigned to a path
enum PathStatus { Safe, Medium, Unsafe }

// Visibility of a path in the shared inventory
enum Visibility { Private, Publishable }

// Path contributed by a cyclist and stored in the inventory
sig Path {
    owner      : one Cyclist,
    segments   : some PathSegment,
    var status : one PathStatus,
    var visibility : one Visibility
}

// Recorded trip made by a cyclist
sig Trip {
    cyclist  : one Cyclist,
    segments : some PathSegment
}

// Lifecycle of automatically detected issues
enum IssueState { NewIssue, Pending, Confirmed, Rejected }

// Potential obstacle detected on a segment during a trip
sig DetectedIssue {
    reporter : one Cyclist,
    trip     : one Trip,
    segment  : one PathSegment,
    var state: one IssueState
}

// Obstacle stored in the shared path inventory
sig Obstacle {
    source  : one DetectedIssue,
    segment : one PathSegment
}

// Abstract locations for route queries
sig Location {}

// Route query between origin and destination
sig RouteQuery {
    origin, destination : one Location,
    var candidates      : set CandidatePath,
    var recommended     : lone CandidatePath
}

// Candidate path returned for a query
sig CandidatePath {
    path  : one Path,
    query : one RouteQuery,
    score : one Int
}



//---------------------------------
// Facts: basic relationships
//---------------------------------

fact OwnershipFacts {

    // Each path is owned by exactly one cyclist and appears in her paths
    always all p: Path | one c: Cyclist | {
        p.owner = c
        p in c.paths
    }

    // Each trip belongs to exactly one cyclist and appears in her trips
    always all t: Trip | one c: Cyclist | {
        t.cyclist = c
        t in c.trips
    }

    // Each issue belongs to its reporter and refers to her trips
    always all i: DetectedIssue | {
        i in i.reporter.issues
        i.trip in i.reporter.trips
        i.segment in i.trip.segments
    }

    // Each obstacle keeps the same segment as its source issue
    always all o: Obstacle | {
        o.segment = o.source.segment
    }

    // Each candidate path is attached to exactly one query
    always all cp: CandidatePath | one q: RouteQuery | {
        cp.query = q
        cp in q.candidates
    }

    // If a query has a recommended candidate, it must be one of its candidates
    always all q: RouteQuery |
        some q.recommended implies q.recommended in q.candidates
}



//---------------------------------
// Facts: issues and obstacles
//---------------------------------

fact IssueAndObstacleFacts {

    // An issue can have at most one obstacle derived from it
    always all i: DetectedIssue |
        lone o: Obstacle | o.source = i

    // Only confirmed issues can give rise to obstacles
    always all i: DetectedIssue |
        (some o: Obstacle | o.source = i) implies i.state = Confirmed

    // For non-confirmed issues there is no obstacle yet
    always all i: DetectedIssue |
        i.state in (NewIssue + Pending + Rejected) implies
            no o: Obstacle | o.source = i
}



//---------------------------------
// Facts: lifecycle of issue state
//---------------------------------

fact IssueLifecycleRules {

    // From NewIssue we may stay New, go Pending, Confirmed, or Rejected
    always all i: DetectedIssue |
        i.state = NewIssue implies
            after i.state in (NewIssue + Pending + Confirmed + Rejected)

    // From Pending we may stay Pending, or become Confirmed or Rejected
    always all i: DetectedIssue |
        i.state = Pending implies
            after i.state in (Pending + Confirmed + Rejected)

    // Once Confirmed, the issue remains Confirmed
    always all i: DetectedIssue |
        i.state = Confirmed implies
            after i.state = Confirmed

    // Once Rejected, the issue remains Rejected
    always all i: DetectedIssue |
        i.state = Rejected implies
            after i.state = Rejected
}



//---------------------------------
// Facts: paths and publishability
//---------------------------------

fact PathVisibilityAndStatus {

    // A path that contains an obstacle cannot be "Safe"
    always all p: Path |
        (some o: Obstacle | o.segment in p.segments) implies
            p.status != Safe

    // Publishable paths must not include segments with unconfirmed issues
    always all p: Path |
        p.visibility = Publishable implies
            no i: DetectedIssue |
                i.segment in p.segments and i.state in (NewIssue + Pending)

    // Paths referenced by candidate routes must be publishable
    always all cp: CandidatePath |
        cp.path.visibility = Publishable
}



//---------------------------
// Facts: recommendations
//---------------------------

fact RecommendationRules {

    // If a query has a recommended candidate, it must have maximal score
    always all q: RouteQuery |
        some q.recommended implies {
            let r = q.recommended |
                all cp: q.candidates | r.score >= cp.score
        }

    // Scores of candidates of the same query are not all equal
    always all q: RouteQuery |
        some q.candidates implies
            some disj c1, c2: q.candidates | c1.score != c2.score
}



//--------------------
// Setup and Execution
//--------------------

pred show {
    // Small scope for visualising trips, issues and obstacles
    #Cyclist       = 3
    #Path          = 3
    #Trip          = 2
    #PathSegment   = 5
    #DetectedIssue = 4
    #Obstacle      = 0
    #RouteQuery    = 0
    #CandidatePath = 0

    // Force a visible trace: start with new issues, then evolve
    all i: DetectedIssue | i.state = NewIssue
    eventually some i: DetectedIssue | i.state = Pending
    eventually some i: DetectedIssue | i.state = Confirmed
    eventually some i: DetectedIssue | i.state = Rejected
}

run show for 6 but 10 steps


pred show2 {
    // Scope for a single route query with candidates
    #Cyclist       = 2
    #Path          = 3
    #Trip          = 0
    #PathSegment   = 5
    #DetectedIssue = 0
    #Obstacle      = 0
    #RouteQuery    = 1
    #CandidatePath = 3

    // Make sure we actually see a recommendation
    one q: RouteQuery | one q.recommended
}

run show2 for 6 but 5 steps
