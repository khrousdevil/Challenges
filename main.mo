import Array "mo:base/Array";
import Nat "mo:base/Nat";

actor {
    public func greet(name : Text) : async Text {
        return "Hello, " # name # "!";
    };
        //Challenge 1
    public func add(n:Nat, m:Nat) : async Nat {
        return (n+m);
    };
    //Challenge 2
    public func square(n:Nat) : async Nat {
        return (n*n);
    };
    //Challenge 3
    public func days_to_second(n:Nat) : async Nat {
        return (n*3600*24);
    };
    //Challenge 4
    var counter:Nat = 1;
    public func increment_counter(n:Nat) : async Nat {
        counter+= n;
        return (counter);
    };
    public func clear_counter() : async Nat{
        counter := 0;
        return (counter);
    };
    //Challenge 5
    public func divide(n:Nat, m:Nat) : async Bool {
        if (n%m == 0) {
            return (true);
        } else {
            return (false);
        };
    };    
    //Challenge 6
    public func is_even(n:Nat) : async Bool {
        if (n%2 == 0) {
            return (true);
        } else {
            return (false);
        };
    };  
    //Challenge 7
    var sum:Nat = 0;
    public func sum_of_array(array:[Nat]) : async Nat {
        if (array.size() != 0) {
            for (i in array.vals()){
                sum+= i;
            };
            return (sum);
        } else {
            return (0);
        };
    };  
    //Challenge 8
    var max:Nat = 0;
    public func maximum(array_max:[Nat]) : async Nat {
        if (array_max.size() != 0) {
            max:=array_max[0];
            for (i in array_max.vals()){
                if (i>=max){
                    max:= i;
                };  
            };
            return (max);
        } else {
            return (0);
        };
    };  
    //Challenge 9
    public func remove_from_array(array_remove:[Nat], x:Nat) : async [Nat] {
        let removeFromArray = func a (n:Nat) : Bool {x!=n};
        let new_array = Array.filter <Nat>(array_remove, removeFromArray);
            return (new_array);
    };  
    //Challenge 10
    public func selection_sort(array_unsorted : [Nat]) : async [Nat]{
        var current_min:Nat = 0;
        for (i in array_unsorted){
            current_min := array[i];
            for (j in array_unsorted){
                if (array_unsorted[j]<current_min){
                    current_min := array_unsorted[j];
                };
            };
            for (k in array_unsorted){
                if (array_unsorted[k]==current_min){
                    array_unsorted[k]=array_unsorted[i];
                }; 
            }
            array_unsorted[i] = current_min;
        }
        return array_unsorted;
    }
};
