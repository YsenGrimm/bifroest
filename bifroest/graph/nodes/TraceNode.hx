package bifroest.graph.nodes;


class TraceNode extends Node {

    public function new() {
        super();

        var tracePort = new Port();
        tracePort.registerIn(traceInput);
        inPorts.set("in", tracePort);
    }

    function traceInput(value : Dynamic) : Void {
        trace( value );
    }

}
