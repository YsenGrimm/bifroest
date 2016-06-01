package bifroest.renderer;

import js.html.CanvasRenderingContext2D;

import bifroest.graph.Node;
import bifroest.utils.Rect;

class DisplayNode {

    public var active : Bool;

    public var width : Float;
    public var height : Float;
    public var x : Float;
    public var y : Float;

    public var inputPorts : Array<DisplayConnector>;
    public var outputPorts : Array<DisplayConnector>;

    public var node : Node;

    var ctx : CanvasRenderingContext2D;

    public function new(x : Float, y : Float, ctx : CanvasRenderingContext2D, node : Node) {
        this.ctx = ctx;
        this.node = node;

        this.x = x;
        this.y = y;

        active = false;

        var inPorts = 0;
        for( port in node.inPorts ) {
            inPorts++;
        }

        var outPorts = 0;
        for( port in node.outPorts ) {
            outPorts++;
        }

        var ports = inPorts > outPorts ? inPorts : outPorts;

        width = 40 + node.name.length * 6;
        height = 20 + ports * 20;

        inputPorts = new Array<DisplayConnector>();
        outputPorts = new Array<DisplayConnector>();

        var inPortsOffset = 1;
        for( port in node.inPorts ) {
            var tmpPort = new DisplayConnector(x, y + inPortsOffset * 20, 5, ctx, ConnectorType.Input, port);
            inputPorts.push(tmpPort);
            inPortsOffset++;
        }

        var outPortsOffset = 1;
        for( port in node.outPorts ) {
            var tmpPort = new DisplayConnector(x + width, y + outPortsOffset * 20, 5, ctx, ConnectorType.Output, port);
            outputPorts.push(tmpPort);
            outPortsOffset++;
        }
    }

    public function updatePortPosition() : Void {
        var inPortsOffset = 1;
        for( port in inputPorts ) {
            port.pos.x = x;
            port.pos.y = y + inPortsOffset * 20;
            inPortsOffset++;
        }

        var outPortsOffset = 1;
        for( port in outputPorts ) {
            port.pos.x = x + width;
            port.pos.y = y + outPortsOffset * 20;
            outPortsOffset++;
        }
    }


    public function render() : Void {
        // draw base
        if (active) {
            ctx.fillStyle = "rgb(214, 158, 158)";
        } else {
            ctx.fillStyle = "rgb(220, 220, 220)";
        }
        ctx.fillRect(x, y, width, height);

        // draw name
        ctx.fillStyle = "rgb(80, 80, 80)";
        ctx.font = "16px sans-serfi";
        ctx.fillText(node.name, x + (width / 2) - ((node.name.length*6)/2), y + 15);

        // draw input ports
        for( port in inputPorts ) {
            port.render();
        }

        // draw output ports
        for( port in outputPorts ) {
            port.render();
        }


    }

}
