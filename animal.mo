module {
    public type Animal = {
        specie : Text;
        family : Text;
        energy : Nat;
};
    public func animal_sleep(n:  Animal) : Animal {
        var animal_slept : Animal = {
            specie = n.specie;
            family = n.family;
            energy = n.energy + 10;
        };
        return (animal_slept);
    };
};