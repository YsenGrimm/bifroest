package bifroest.graph.nodes;

class ScalarNode extends Node {

    var val : Float;

    public function new(scalar : Float) {
        super();
        val = scalar;
        var outPort = new Port(this);
        outPort.registerOut(sendScalar);
        outPorts.set("out", outPort);
    }

    function sendScalar() : Float {
        return val;
    }

}
