package bifroest.graph;

class Port {

    public var node : Node;

    var inCallback : Dynamic -> Void;
    var outCallback : Void -> Dynamic;

    public function new(node : Node) {
        this.node = node;
    }

    public function registerIn(inCallback : Dynamic -> Void) : Void {
        this.inCallback = inCallback;
    }

    public function registerOut(outCallback : Void -> Dynamic) : Void {
        this.outCallback = outCallback;
    }

    public function onIn(data : Dynamic) : Void {
        inCallback(data);
    }

    public function onOut() : Dynamic {
        return outCallback();
    }

}
