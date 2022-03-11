module{
    public type List<T> = ?(T, List<T>);

    public func is_null<T>(l : List<T>) : Bool {
        switch(l){
            case(null) {
                return (true);
            };

            case(?l){
                return (false);
            };
        };
         
    };

    public func last<T>(l : List<T>) : ?T {
        switch(l){
            case(null) {
                return(null);
            };

            case(?l){
                return (false);
            };
        };
         
    };
};
