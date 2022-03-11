import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Cycles "mo:base/ExperimentalCycles";
import Iter "mo:base/Iter";
import Array "mo:base/Array";
import Nat "mo:base/Nat";


actor {
    //Challenge 1
    public shared({caller}) func is_anonymous() : async Bool{
        let anonymous = Principal.fromText("2vxsx-fae");
        
        if (caller == anonymous){
            true;
        } 
        else{
            false;
        };
    };

    //Challenge 2
    let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

    //Challenge 3 and 4
    public shared({caller}) func add_favorite_number (n:Nat) : async(){
        favoriteNumber.put(caller, n);
    };
    public shared({caller}) func show_favorite_number () : async ?Nat {
        return(favoriteNumber.get(caller)); 
    };

    //Challenge 4
    public shared({caller}) func add_favorite_number_rewrite (n:Nat) : async Text {

        switch(favoriteNumber.get(caller)){
            case(null) {
                return ("You've already registered your number"); 
            };
            case(?something){
                favoriteNumber.put(caller, n);
                return ("You've successfully registered your number");                
            };
        };
    };

    //Challenge 5
    public shared({caller}) func delete_favorite_number () : async ?Nat {
        return(favoriteNumber.remove(caller));
    };

    public shared({caller}) func update_favorite_number (n:Nat) : async ?Nat {
        return(favoriteNumber.replace(caller,n));
    };


    //Challenge 6

    public func deposit_cycles() : async Nat {

        let n = Cycles.accept(Cycles.available());
        return(n);
    };

    //Challenge 7

    //public shared({caller}) func withdraw_cycles (n:Nat) : async (){
    //    caller.deposit_cycles()
    //}
    //n = number of cycle to withdraw from the canister, and send to the caller

    //Challenge 8

    stable var counter : Nat = 1;
    stable var version_number : Nat = 0;
    public func increment_counter(n:Nat) : async Nat {
        counter+= n;
        return (counter);
    };

    system func postupgrade() {
        version_number +=1;
    };


};