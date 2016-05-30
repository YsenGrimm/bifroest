package bifroest.graph;

class Node {

    public var inPorts : Map<String, Port>;
    public var outPorts : Map<String, Port>;

    public function new() {
        inPorts = new Map<String, Port>();
        outPorts = new Map<String, Port>();
    }

}
