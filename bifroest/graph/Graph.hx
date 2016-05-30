package bifroest.graph;

class Graph {

    public var nodes : Map<String, Node>;

    public function new() {
        nodes = new Map<String, Node>();
    }

    public function addNode(name : String, node : Node) : Void {
        nodes.set(name, node);
    }

    public function addEdge(fromName : String, outPort : String, toName : String, inPort : String) : Void {
        var outVal = nodes.get(fromName).outPorts.get(outPort).onOut();
        nodes.get(toName).inPorts.get(inPort).onIn(outVal);
    }

}
