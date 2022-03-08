import Nat8 "mo:base/Nat8";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Text "mo:base/Text";
import Nat32 "mo:base/Nat32";
actor {
    //Challenge 1
    public func nat_to_nat8(n : Nat) : async Nat8 {
      return(Nat8.fromNat(n));
    };
    //Challenge 2
    public func max_number_with_n_bits (n : Nat) : async Nat {
        return (2**n-1);
    };
    //Challenge 3
    public func decimal_to_bits (n:Nat) : async Text {
        var x:Nat = 0;
        var m:Nat = n;
        var count:Nat = 0;
        while (m > 0){
            x := m % 2 * 10**(count) + x ;
            m := m/2;
            count +=1;
        };
        return(Nat.toText(x));
    };
    //Challenge 4
    public func capitalize_character(c : Char) : async Char {
        let x = Char.toNat32(c);
        if (x >= 97 and x<=122){
            return (Char.fromNat32(x-32));
        }
        else {
            return (Char.fromNat32(x))
        };
    };

    //Challenge 5
    //public func capitalize_text(t : Text) : async Char {
      //for (char in t.chars()){
        //  var x : Nat32 = Char.toNat32(char);
          // var w : Text = "";
            //if (x >= 97 and x <= 122){
          //     w := Nat32.toText(x-32) # w;
          // }
          // else {
           //     w := Char.toText(char) # w;
          // };
        //};
        //return (w : Text);
    //};

    //Challenge 6
    public func is_inside(t : Text, c:Char) : async Bool {
        var x:Bool = false;
        for (char in t.chars()){
            if (c == char){
                x := true;
        };
        };
        return (x);
    };

    //Challenge 7
    public func trim_whitespace(t : Text) : async Text {
        return(Text.trim(t :Text,#text " ")); 
    };

    //Challenge 8
    //public func duplicated_character (t:Text) : async Text {
      //  var duplicated_c = Char.fromNat32(0)
       // var count = true;
       // while (count == true){
        //    for (char in t.chars()){
          //      for (x in t.chars()){
            //        if (char==x){
              //          return (Char.toText(char))
                //        count :=false;
                  //  }
              //  };    
           // };
      //  }
        //else{

        //};
    //}; 

    //Challenge 9
    public func size_in_bytes (t:Text) : async Nat8{
        let x = t.size();
        return(Nat8.fromNat(x));
    };

    //Challenge 10
    //public func bubble_sort (a:[Nat]) : async [Nat]{

    //}
};


