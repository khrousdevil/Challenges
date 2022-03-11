import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Cycles "mo:base/ExperimentalCycles";
import Iter "mo:base/Iter";
import Array "mo:base/Array";
import Nat "mo:base/Nat";


actor{

    stable var entries : [(Principal,Nat)] = [];

    let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

    public shared({caller}) func add_favorite_number (n:Nat) : async(){
        favoriteNumber.put(caller, n);
    };
    public shared({caller}) func show_favorite_number () : async ?Nat {
        return(favoriteNumber.get(caller)); 
    };

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

    public shared({caller}) func delete_favorite_number () : async ?Nat {
        return(favoriteNumber.remove(caller));
    };

    public shared({caller}) func update_favorite_number (n:Nat) : async ?Nat {
        return(favoriteNumber.replace(caller,n));
    };

    system func preupgrade() {
        entries := Iter.toArray(favoriteNumber.entries());
     };

    system func postupgrade() {
        entries := [];
    };
};