package bifroest.graph;

class Edge {

    public var from : Port;
    public var to : Port;

    public function new(from : Port, to : Port) {
        this.from = from;
        this.to = to;
    }

}
