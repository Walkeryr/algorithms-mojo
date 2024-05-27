struct Reader:
    var source: String;

    fn __init__(inout self, source: String):
        self.source = source

    fn read_all_ints(self) raises -> List[Int]:
        var values = List[Int]()

        with open(self.source, "r") as f:
            var lines = f.read().split('\n')
            for line in lines:
                var num = int(line[])
                values.append(num)
        
        return values

fn main():
    from sys import argv

    var args = argv()

    if len(args) <= 1:
        print("No arguments were provided.")
        return

    var numbers: List[Int]
    try:
        numbers = Reader(args[1]).read_all_ints()
    except error:
        print("Error reading integers from file:", error)
        return
    
    print(__type_of(numbers).__str__(numbers))
