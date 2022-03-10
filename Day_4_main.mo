import Blockchain "custom";
import Animal "animal";
import List "mo:base/List";


actor {
    public type Blockchain = Blockchain.Blockchain;
    public type Animal = Animal.Animal;

    //Challenge 1

    public func fun() : async Blockchain{

            let bitcoin : Blockchain = {
             name = "Bitcoin";
             conseus = "POW";
             year_of_launch = "2009";
            };
        return (bitcoin);
    };

    //Challenge 2

        public func abc() : async Animal {
            var animal : Animal = {
             specie = "Tiger";
             family = "Felidae";
             energy = 10;
            };
        Animal.animal_sleep(animal);

        };

    //Challenge 4
    public func create_animal_then_takes_a_break (specie : Text, energy : Nat) : async Animal {
            var animal : Animal = {
             specie = specie;
             family = "";
             energy = energy;
            };
        Animal.animal_sleep(animal);
    };


    //Challenge 5
    public type List<Animal> = ?(Animal, List<Animal>);
        var animal_list: List<Animal> = List.nil<Animal>();

    //Challenge 6
    public func push_animal (ani : Animal) : async () {
        animal_list := List.push<Animal>(ani,animal_list);
        //return (new_animal_list);
    };
    public func get_animals () : async [Animal] {
        return List.toArray(animal_list: List<Animal>);
    };

};
