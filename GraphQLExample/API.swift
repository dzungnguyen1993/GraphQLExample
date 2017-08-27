//  This file was automatically generated and should not be edited.

import Apollo

public final class GirlsDetailsQuery: GraphQLQuery {
  public static let operationString =
    "query GirlsDetails {" +
    "  allGirls {" +
    "    __typename" +
    "    ...GirlFullDetails" +
    "  }" +
    "}"

  public static var requestString: String { return operationString.appending(GirlFullDetails.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allGirls", type: .nonNull(.list(.nonNull(.object(AllGirl.self))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(allGirls: [AllGirl]) {
      self.init(snapshot: ["__typename": "Query", "allGirls": allGirls])
    }

    public var allGirls: [AllGirl] {
      get {
        return (snapshot["allGirls"]! as! [Snapshot]).map { AllGirl(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "allGirls")
      }
    }

    public struct AllGirl: GraphQLSelectionSet {
      public static let possibleTypes = ["Girl"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("age", type: .nonNull(.scalar(Int.self))),
        GraphQLField("height", type: .nonNull(.scalar(Double.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, age: Int, height: Double) {
        self.init(snapshot: ["__typename": "Girl", "id": id, "name": name, "age": age, "height": height])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var age: Int {
        get {
          return snapshot["age"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "age")
        }
      }

      public var height: Double {
        get {
          return snapshot["height"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "height")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot = newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var girlFullDetails: GirlFullDetails {
          get {
            return GirlFullDetails(snapshot: snapshot)
          }
          set {
            snapshot = newValue.snapshot
          }
        }
      }
    }
  }
}

public final class CreateGirlMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateGirl($name: String!, $age: Int!, $height: Float!) {" +
    "  createGirl(name: $name, age: $age, height: $height) {" +
    "    __typename" +
    "    id" +
    "  }" +
    "}"

  public var name: String
  public var age: Int
  public var height: Double

  public init(name: String, age: Int, height: Double) {
    self.name = name
    self.age = age
    self.height = height
  }

  public var variables: GraphQLMap? {
    return ["name": name, "age": age, "height": height]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createGirl", arguments: ["name": Variable("name"), "age": Variable("age"), "height": Variable("height")], type: .object(CreateGirl.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createGirl: CreateGirl? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createGirl": createGirl])
    }

    public var createGirl: CreateGirl? {
      get {
        return (snapshot["createGirl"]! as! Snapshot?).flatMap { CreateGirl(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createGirl")
      }
    }

    public struct CreateGirl: GraphQLSelectionSet {
      public static let possibleTypes = ["Girl"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID) {
        self.init(snapshot: ["__typename": "Girl", "id": id])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class UpdateGirlMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateGirl($id: ID!, $newName: String!, $newAge: Int!, $newHeight: Float!) {" +
    "  updateGirl(id: $id, name: $newName, age: $newAge, height: $newHeight) {" +
    "    __typename" +
    "    id" +
    "  }" +
    "}"

  public var id: GraphQLID
  public var newName: String
  public var newAge: Int
  public var newHeight: Double

  public init(id: GraphQLID, newName: String, newAge: Int, newHeight: Double) {
    self.id = id
    self.newName = newName
    self.newAge = newAge
    self.newHeight = newHeight
  }

  public var variables: GraphQLMap? {
    return ["id": id, "newName": newName, "newAge": newAge, "newHeight": newHeight]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateGirl", arguments: ["id": Variable("id"), "name": Variable("newName"), "age": Variable("newAge"), "height": Variable("newHeight")], type: .object(UpdateGirl.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateGirl: UpdateGirl? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateGirl": updateGirl])
    }

    public var updateGirl: UpdateGirl? {
      get {
        return (snapshot["updateGirl"]! as! Snapshot?).flatMap { UpdateGirl(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateGirl")
      }
    }

    public struct UpdateGirl: GraphQLSelectionSet {
      public static let possibleTypes = ["Girl"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID) {
        self.init(snapshot: ["__typename": "Girl", "id": id])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public struct GirlFullDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment GirlFullDetails on Girl {" +
    "  __typename" +
    "  id" +
    "  name" +
    "  age" +
    "  height" +
    "}"

  public static let possibleTypes = ["Girl"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("age", type: .nonNull(.scalar(Int.self))),
    GraphQLField("height", type: .nonNull(.scalar(Double.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, name: String, age: Int, height: Double) {
    self.init(snapshot: ["__typename": "Girl", "id": id, "name": name, "age": age, "height": height])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return snapshot["name"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }

  public var age: Int {
    get {
      return snapshot["age"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "age")
    }
  }

  public var height: Double {
    get {
      return snapshot["height"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "height")
    }
  }
}