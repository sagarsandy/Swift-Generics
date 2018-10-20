import UIKit


/*
 Always try to simplify the code
 Avoid Duplicatations
 
 Generic code enables you to write flexible, reusable funcations and types that can work with any types, subject to requirements that you define.
 */

let namesArray = ["Sagar", "Sandy", "Bunny"]
let ageArray = [23, 24, 25]
let heightsArray = [5.8, 5.9, 5.95]

func printNamesArray(names : [String]) {
    for name in names {
        print(name)
    }
}

func printAgeArray(ages : [Int]) {
    for age in ages {
        print(age)
    }
}


func printHeightsArray(heights : [Double]) {
    for height in heights {
        print(height)
    }
}

// So basically we endedup writing three functions for executing same block of code, there are couple of ways to shorten this. Let's see generics way

// Generics

func sampleGenericFunc<T>(value : T) {
    print(value)
}
// T should be common at both places. You can name it whatever you want, but T is most used.
sampleGenericFunc(value: "Hello")
sampleGenericFunc(value: 23)

func genericFuncWithArrayInput<T>(value : [T]) {
    
    for element in value {
        print(element)
    }
}

genericFuncWithArrayInput(value: namesArray)
genericFuncWithArrayInput(value: ageArray)
genericFuncWithArrayInput(value: heightsArray)

// Structs with generics

// This is basic struct
struct Phones {
    var modals : [String] = []
    
    mutating func push(modal : String) {
        modals.append(modal)
    }
    
}

var allPhones = Phones()
allPhones.push(modal: "iPhone")
print(allPhones.modals)

// This is generic struct
struct GenericPhones<T> {
    
    var modals : [T] = []
    
    mutating func push(modal : T) {
        modals.append(modal)
    }
}

// There are two types of initialization
// 1. Implicitly defining the type of T

let modalNames = GenericPhones(modals: ["iPhone", "Galaxy", "Oppo"])
// In the above line the T type is string, which is taken automatically(Implicit)

// 2. Expilicitly defining the type of T
var newModalNames = GenericPhones<String>()
// In the above line we have explicitly defined the type of T as string, now we can't push values other than string
newModalNames.push(modal: "iPhone")

// However the generic based code can be used as type constriant also sometimes
class Watch {}

class Fasttrack : Watch {}

// We can specify what kind of type it can take ex: String, int, any class type objects..
func addWatchesOnly<T : Watch>(watches: [T]) {
    
    // Some code block
}

let apple = Watch()
let sony = Watch()
let bingo = Fasttrack()
addWatchesOnly(watches: [apple, sony, bingo])

// In the above line we've used only watch based objects in the array, bingo is a class of Fasttrak, but still it's parent class is watch. So it is also accepted.


//addWatchesOnly(watches: ["Hello"]) // We can't execute this line, because we are using strings in the array. That function can take only watch objects







