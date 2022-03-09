import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Option "mo:base/Option";

actor {
    // Chanllenge 1
    private func swap (a : [var Nat] , j : Nat , i : Nat) : [Nat] {
        let n = a[j];
        let m = a[i];
        a[j] := m;
        a[i] := n;
        let b = Array.freeze<Nat>(a);
        return (b);
    };

    //public func _swap(array : [Nat], i : Nat, j : Nat) : async [Nat] {
    //  let mutable_array = Array.thaw<Nat>(array);
    //    let tmp = array[i];
    //    mutable_array[i] := mutable_array[j];
    //    mutable_array[j] := tmp;
    //    let immutalbe_array = Array.freeze<Nat>(mutable_array);
    //}

    //Challenge 2
    public func init_count(n:Nat) : async [Nat]{
        //let array:[Nat] = [];
        //let mutable_array = Array.thaw<Nat>(array);
        //let iter = Iter.range (0,n);
        //for (i in iter){
        //    mutable_array[i] := i;
        //};
        //mutable_array[n] := n;
        //let immutable_array = Array.freeze<Nat>(mutable_array);
        let iter = Iter.range(0,n-1);
        let array = Iter.toArray(iter);
        return (array);
    };

    //Challenge 3
    public func seven(a:[Nat]) : async Text{
        var bool:Bool = false;
        for (i in a.vals()){
            if (i==7){
                bool := true;
            };
        };
        if (bool == true){
            return ("Seven is found");
        }
        else {
            return ("Seven not found");
        };
    };

    //Challenge 4
    public func nat_opt_to_nat(n : ?Nat, m : Nat) : async Nat {
        switch(n){
            // Case where n is null
            case(null) {
                return (m);
            };
            // Case where n is a nat
            case(?something){
                return (something);
            };
        };
    };


    //Challenge 5
    public func day_of_the_week(n : Nat) : async ?Text {
        let array = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]; 
         for(number in array.keys()){
            if(n == number + 1) {
                return ?array[number];
            };
        };
        return null;
    };

    //Challenge 6
    //public func populate_array(n : ?Nat) : async Nat {
    //   var counter : Nat = 0;
    //   let s = n.size();
    //   Option.iterate(s,func (x : Nat) { counter += x });
    //   return (counter);

    //};
    //private func init_count(y:Nat) : [Nat]{
    
     //   let iter = Iter.range(0,y-1);
       // let array = Iter.toArray(iter);
       // return (array);
    //};



    //Challenge 7
     public func sum_of_array(array : [Nat]) : async Nat {
   
        return(Array.foldRight<Nat,Nat>(array, 0 , Nat.add));
    };

        //Challenge 8
    let k = func (n : Nat) : Nat {
        return(n**2);
    };

    public func squared_array(array : [Nat]) : async [Nat] {
        return(Array.map<Nat,Nat>(array, k));
    };


    //Challenge 9
    //let p = func (n : Nat) : Nat {
    //    return(n);
    //};

    //public func increase_by_index(array : [Nat]) : async [Nat] {
        
    //    return(Array.map<Nat,Nat>(array, p));
    //};

    //Challenge 10
    func contains<A>(xs : [A], a: A, f : (A,A) -> Bool) : Bool {
        
    }
    
};



