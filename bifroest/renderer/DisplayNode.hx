package bifroest.renderer;

import js.html.CanvasRenderingContext2D;

import bifroest.graph.Node;

class DisplayNode {

    var ctx : CanvasRenderingContext2D;
    var node : Node;
    var width : Float;
    var height : Float;
    var x : Float;
    var y : Float;

    public function new(ctx : CanvasRenderingContext2D, node : Node) {
        this.ctx = ctx;
        this.node = node;

        width = 60;

        var inPorts = 0;
        for( port in node.inPorts ) {
            inPorts++;
        }

        var outPorts = 0;
        for( port in node.outPorts ) {
            outPorts++;
        }

        var ports = inPorts > outPorts ? inPorts : outPorts;
        height = 20 + ports * 20;

        x = 100;
        y = 100;
    }

    public function render() : Void {
        // draw base
        ctx.fillStyle = "rgb(220, 220, 220)";
        ctx.fillRect(x, y, width, height);

        // draw name
        ctx.fillStyle = "rgb(100, 100, 100)";
        ctx.font = "16px sans-serfi";
        ctx.fillText(node.name);

        // draw input ports
        ctx.fillStyle = "rgb(87, 158, 25)";
        var inPortsOffset = 0;
        for( port in node.inPorts ) {
            ctx.beginPath();
            ctx.arc(x, y + inPortsOffset * 20, 10, 0, Math.PI*2);
            ctx.fill();
            inPortsOffset++;
        }

        // draw output ports
        ctx.fillStyle = "rgb(191, 73, 43)";
        var outPortsOffset = 0;
        for( port in node.inPorts ) {
            ctx.beginPath();
            ctx.arc(x + width, y + outPortsOffset * 20, 10, 0, Math.PI*2);
            ctx.fill();
            inPortsOffset++;
        }
    }

}
