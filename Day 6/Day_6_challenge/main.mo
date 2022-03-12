import Time "mo:base/Time";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import HashMap "mo:base/HashMap";
import Nat32 "mo:base/Nat32";
import Result "mo:base/Result";
import Principal "mo:base/Principal";
import Text "mo:base/Text";
import Hash "mo:base/Hash";
import List "mo:base/List";
import HTTP "http";
import Option "mo:base/Option";
import Iter "mo:base/Iter";

actor {

    stable var entries : [(Nat,Principal)] = [];

    //Challenge 1
    type TokenIndex = Nat.Nat;
    public type Error = {
        #Anonymous : Text;
    };

    //Challenge 2
    //let registry = HashMap.HashMap<TokenIndex, Principal>(0, TokenIndex.equal, (TokenIndex.fromNat).hash);
    var registry = HashMap.HashMap<TokenIndex, Principal>(0, Nat.equal, Hash.hash);

    //Challenge 3
    var nextTokenIndex : Nat = 0; //keep track of number of minted NFTs
    type Result<Ok, Err> = {#ok : Ok; #err : Err};
    //public type Result = Result.Result;
    public shared({caller}) func mint () : async Result<(),Text> {
        let anonymous = Principal.fromText("2vxsx-fae");

        if (caller == anonymous){
            return #err ("You need to be authenticated to mint"); 
        } 
        else{
            registry.put(nextTokenIndex, caller);
            nextTokenIndex += 1;
            return #ok;     
        };

    };  

    //Challenge 4
    //public func transfer (to : Principal, tokenIndex : Nat) : async Result <Text,Text> {
    //    if (tokenIndex > registry.size()){
    //        return #err ("No such token");
     //   }
    //    else {
    //    registry.replace(tokenIndex,to);
    //        return #ok ("The token has been successfully transferred");
    //    };
   // };

    //Challenge 5
    var nftList = List.nil<TokenIndex>();
    public type List<TokenIndex> = ?(TokenIndex, List<TokenIndex>);
    public shared ({caller}) func balance () : async List<TokenIndex> {
        for ( (k,v) in registry.entries()) {
           nftList := List.push<TokenIndex>(k, nftList);
            };
        
        return nftList;
    };

    //trytry 

    //Challenge 6
     public query func http_request(request : HTTP.Request) : async HTTP.Response {

    let nft_minted = registry.size();
    let lastID = registry.get(nft_minted-1);
    let lastIDP = Option.get(lastID, Principal.fromText("2vxsx-fae"));

    let response = {
      body = Text.encodeUtf8("NFT minted: " # Nat.toText(nft_minted) 
      # "," # "Last Principal: " # Principal.toText(lastIDP));

      headers = [("Content-Type", "text/html; charset=UTF-8")];
      status_code = 200 : Nat16;
      streaming_strategy = null
    };

      return(response);
    };

// Challenge 7
    system func preupgrade() {
        entries := Iter.toArray(registry.entries());
     };

    system func postupgrade() {
        registry := HashMap.fromIter<TokenIndex,Principal>(entries.vals(),0,Nat.equal, Hash.hash);
        entries := [];
    };

};