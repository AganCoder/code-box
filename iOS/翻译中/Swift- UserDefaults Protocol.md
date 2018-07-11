# Swift: UserDefaults Protocol
Swift eye for the stringly typed API

Swift 3 brought a tsunami of changes to the language as well as our codebase, some of you reading this may even still be battling with the migration too. But even with all these changes, we’re still left with some APIs within Foundation that are stringly typed, which is totally fine… Until it’s not.

It’s kind of a love/hate relationship in that we love the flexability that strings within APIs afford us, but we hate that we have to use them because of the inherit consequences they bring if we’re not careful, they’re pretty much the programming equivalent of running with scissors.

We’re given stringly typed APIs because the Foundation framework engineering gods could not predetermine exactly how we intend to use them. So in all their wisdom, power and knowledge, they decided to use strings in some of the APIs because of the unlimited possibilities it creates for us as developers. It’s either that or some type of dark arcane magic.

## UserDefaults
Our topic for today is going to be one of the first APIs I became familiar with when learning iOS development . For those that aren’t familiar, it’s simply a persistant data storage for small sets of information, such as a single image or some application settings. Some people like to think of it is as some kind of “Diet Core Data”, however it’s nowhere near as robust, no matter how hard people try to wedge it in as a replacement.


### Stringly typed API

```swift
UserDefaults.standard.set(true, forKey: “isUserLoggedIn”)

UserDefaults.standard.bool(forKey: "isUserLoggedIn")

```

A common practice for UserDefaults usage inside an app, it simply allows us to set a value persistantly and retrieve, override or remove it from wherever in our app. But if we’re not careful, we can trip ourselves up with lack of uniformity or context, but most likely typos. In this post, we’re going to transform the generalised nature of UserDefaults and customise it to our own needs.


### Use constants

```swift
let key = "isUserLoggedIn"

UserDefaults.standard.set(true, forKey: key)

UserDefaults.standard.bool(forKey: key)

```

I guarantee you will instantly write better code if you follow this one weird trick. If you write a string more than once, convert it into a constant and live by this rule until the end of your days, feel free to thank me in the next life.

### Group constants

```swift
struct Constants {
    let isUserLoggedIn = "isUserLoggedIn"
}

...

UserDefaults.standard
   .set(true, forKey: Constants().isUserLoggedIn)

UserDefaults.standard
   .bool(forKey: Constants().isUserLoggedIn)

```

One pattern than can help us maintain uniformity is when group all our important default constants in a single place. So here we’ve made a `Constants` struct that we can store and reference our defaults from.

Another good tip is to aim to have your property name reflect its own value, especially when working with defaults. Doing this will simplify your code and overall attribute to better uniformity. Copying property names and pasting them inside strings will help you avoid typos.

```swift
let isUserLoggedIn = "isUserLoggedIn"

```

### Add Context

```swift

struct Constants {
    struct Account
        let isUserLoggedIn = "isUserLoggedIn"
    }
}

...

UserDefaults.standard
   .set(true, forKey: Constants.Account().isUserLoggedIn)

UserDefaults.standard
   .bool(forKey: Constants.Account().isUserLoggedIn)


```


Just having a `Constants` struct is totally fine, but we shouldn’t forget about providing context when writing code. A good practice to aim towards is to make your code read more readable to whomever is working with it, including yourself.

```swift
Constants().token // Huh?

```

What does `token` mean? When someone is trying to distinguish what token relates to, the lack of namespacing context really makes it difficult to someone that is new or unfamiliar to the codebase, or the original author one year into the future.

```swift
Constants.Authentication().token // better

```

### Avoid initialization

```swift

struct Constants {
    struct Account
        let isUserLoggedIn = "isUserLoggedIn"
    }
    private init() { }
}

```

Because we never intend, nor want our Constants struct to be initialised, we declare our initializer to be private. This is more of a precautionary step, but I would still recommend doing it. At the very least it will prevent us from accidently declaring instance properties when we only want static. But speaking of static…


### Static variables

```swift

struct Constants {
    struct Account
        static let isUserLoggedIn = "isUserLoggedIn"
    }
    ...
}

...

UserDefaults.standard
   .set(true, forKey: Constants.Account.isUserLoggedIn)

UserDefaults.standard
   .bool(forKey: Constants.Account.isUserLoggedIn)

```

You may have noticed that each time we wanted to access the key, we would have to initialize the struct of which it belonged to. Instead of having to do that each time, we should use the `static` declaration.

We use `static` instead of `class` because we’ve chosen a `struct` as our storage type. According to Swift-compiler law, structs cannot use the `class` property declaration. Also, if you use a `static` declaration on a property in a `class`, it is the same as declaring that property `final class`.

```swift

final class name: String
static name: String
// final class == static

```

#### Fewer typos with enum cases

```swift

enum Constants {
    enum Account : String {
        case isUserLoggedIn
    }
    ...
}

...

UserDefaults.standard
    .set(true, forKey: Constants.Account.isUserLoggedIn.rawValue)

UserDefaults.standard
    .bool(forKey: Constants.Account.isUserLoggedIn.rawValue)

```

Earlier in this post, we talked about making our properties reflect their values for uniformity. Here we’re going to go a step further by automating the process using and `enum case` instead of `static let`.

As you may have noticed, we’ve made our `Account` enum conform to `String`, which also conforms to `RawRepresentable` protocol. We’re doing this because if we don’t provide a `rawValue` for the `case`, it will default to a reflection of the case. The less manual typing or copy/pasting of strings we have to do, the better.

```swift
// Constants.Account.isUserLoggedIn.rawValue == "isUserLoggedIn"
```

Up until now we’ve managed to do some pretty cool things with `UserDefaults`, but I would argue that we haven’t done enough awesome things. The biggest problem is that we’re still working with stringly typed APIs, even though we’ve dressed that string up, it’s still not good enough for our projects.

We’re in this mentality that we can only work with what’s given to us. Swift is an insanely great language and we should be challenging a lot of what we’ve learnt and know from our days writing Objective-C. Let’s go back to the kitchen and sprinkle some syntax sugar on these APIs.


### API Goals

```swift
UserDefaults.standard.set(true, forKey: .isUserLoggedIn) 
// #APIGoals

```

For the rest of this talk, we’re going to strive to create better APIs to work with when we’re interacting with `UserDefaults` that suit our needs instead of the general populus, and what better way than to do so than making extensions with protocols.

#### BoolUserDefaultable

```swift
protocol BoolUserDefaultable {
    associatedType BoolDefaultKey : RawRepresentable
}

```




