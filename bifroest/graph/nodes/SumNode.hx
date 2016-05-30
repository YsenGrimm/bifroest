package bifroest.graph.nodes;


class SumNode extends Node {

    var val : Float;

    public function new() {
        super();

        val = 0;

        var portA = new Port();
        var portB = new Port();
        var outPort = new Port();

        portA.registerIn(valInput);
        portB.registerIn(valInput);
        outPort.registerOut(sumOut);

        inPorts.set("A", portA);
        inPorts.set("B", portB);
        outPorts.set("out", outPort);
    }

    function valInput(value : Float) : Void {
        val += value;
    }

    function sumOut() : Float {
        return val;
    }

}
