package bifroest.graph;

class Graph {

    public var nodes : Map<String, Node>;
    public var edges : Array<Edge>;

    public function new() {
        nodes = new Map<String, Node>();
        edges = new Array<Edge>();
    }

    public function addNode(name : String, node : Node) : Void {
        node.name = name;
        nodes.set(name, node);
    }

    public function addEdge(fromName : String, outPort : String, toName : String, inPort : String) : Void {
        var outp = nodes.get(fromName).outPorts.get(outPort);
        var inp = nodes.get(toName).inPorts.get(inPort);
        edges.push(new Edge(outp, inp));
        
        var outVal = nodes.get(fromName).outPorts.get(outPort).onOut();
        nodes.get(toName).inPorts.get(inPort).onIn(outVal);
    }

}
