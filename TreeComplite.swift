 class BinaryTree {

     var number: Int
     var left: BinaryTree?
     var right: BinaryTree?

     init(number: Int) {
         self.number = number
         self.left = nil
         self.right = nil
     }
 }

 var tree: BinaryTree?

 func addNodeTree() {
                         
    var list: [Int] = []
    
    repeat {
        print("Type a number or enter the letter (n) to finish: ", terminator: "")
    
        guard let input = readLine() else {
            print("Invalid input. Please enter a valid number or 'n' to finish.")
            continue
        }
    
        if let parsedNumber = Int(input) {
            list.append(parsedNumber)
        } else if input.lowercased() == "n" {
            print("Finished entering numbers.")
            break
        } else {
            print("Invalid input. Please enter a valid number or 'n' to finish.")
        }
    } while true
    
    for number in list {
        insertNodeTree(number: number)
    }
    
         callMenuTree()
 }


 func insertNodeTree(number: Int) {

   let newNode = BinaryTree(number: number)
   if tree == nil {
     tree = newNode
   } else {
     var current = tree
     var prev: BinaryTree?

     while current != nil {
       prev = current
       if number < current!.number {
         current = current?.left
       } else {
         current = current?.right
       }
     }
     if number < prev!.number {
       prev?.left = newNode
     } else {
       prev?.right = newNode
     }
   }
 }



 func callMenuTree() {

   var option: Int
   repeat {
     print("\n\nManager of tree.")
     print("1 - show tree.")
     print("2 - add node.")
     print("3 - search node.")
     print("4 - create default tree.")
     print("5 - remove node.")
     print("6 - exit.")
     print("Type the option: ", terminator: "")

     if let input = readLine(), let inputNumber = Int(input) {
         option = inputNumber
       } else {
         option = 0
       }
     } while option < 1 || option > 6
     switch option {
       case 1: showTree()
       case 2: addNodeTree()
       case 3: searchNode()
       case 4: createDefaultTree()
       case 5: removeNode()
       case 6: break
       default: break
     }
   }
func createDefaultTree(){}
 func showTreeInorden(_ aux: BinaryTree?) {
   if let auxs = aux {
     showTreeInorden(auxs.left)
     print(auxs.number, terminator: " ")
     showTreeInorden(auxs.right)
   }
 }
   func showTreePreorden(_ aux: BinaryTree?) {
     if let aux = aux {
       print(aux.number, terminator: " ")
       showTreePreorden(aux.left)
       showTreePreorden(aux.right)
     }
   }
   func showTreePostorden(_ aux: BinaryTree?) {
     if let aux = aux {
       showTreePostorden(aux.left)
       showTreePostorden(aux.right)
       print(aux.number, terminator: " ")
     }
   }

 func showTree() {

   var option: Int

   repeat {
       print("\n\nSelect an option:")
       print("1 - Inorden.")
       print("2 - Preorden.")
       print("3 - Postorden.")
       print("Type the option: ", terminator: "")

       if let input = readLine(), let value = Int(input) {
           option = value
       } else {
           option = 0
       }

   } while option < 1 || option > 3

   switch option {
   case 1:
       print("\n\nTREE SHOWED INORDEN")
       showTreeInorden(tree)
       print("\n\n")

   case 2:
       print("\n\nTREE SHOWED PREORDEN")
       showTreePreorden(tree)
       print("\n\n")

   case 3:
       print("\n\nTREE SHOWED POSTORDEN")
       showTreePostorden(tree)
       print("\n\n")
   default: 
     return
   }

   callMenuTree()
 }
 callMenuTree()
 // Asegúrate de tener un objeto BinaryTree llamado 'tree' antes de llamar a showTree()


func searchNodeTree(number: Int, remove: Bool) {
  
    var rounds = 0
    var searching = tree
    var prev: BinaryTree? = nil
    while let current = searching {
        if number == current.number {
            break
        } else {
            prev = current
        }
        if number < current.number {
            searching = current.left
        } else {
            searching = current.right
        }
        rounds += 1
    }
    if searching == nil {
        print("\nNode \(number) not found\n")
    } else {
        if !remove {
            print("\nNode \(number) found after \(rounds + 1) rounds")
        } else {
          removeNodeTree(aux: searching!, prev: prev)

        }
    }

    callMenuTree()
}

func searchNode() {
    var number: Int
    print("What number do you want to search?: ")
    number = Int(readLine()!) ?? 0
    searchNodeTree(number: number, remove: false)
}

func removeNode() {
    var number: Int
    print("What number do you want to remove?: ")
    number = Int(readLine()!) ?? 0
    searchNodeTree(number: number, remove: true)
}









