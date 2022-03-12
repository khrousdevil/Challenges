actor {

    type Result<Bool , Text> = {#ok: Bool; #announ : Text};
    let other_canister : actor { mint : () -> async Result<(), Text>} = actor("rrkah-fqaaa-aaaaa-aaaaq-cai"); // check your day 6 challenge canister, it's mine
    public shared ({caller}) func mint() : async Result<(),Text> {
        return(await other_canister.mint())
    };
}