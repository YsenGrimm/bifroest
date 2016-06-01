package bifroest.renderer;

import js.html.CanvasRenderingContext2D;

import bifroest.utils.Vector2D;
import bifroest.graph.Port;

class DisplayConnector {

    public var pos : Vector2D;
    public var radius : Float;

    public var port : Port;

    var ctx : CanvasRenderingContext2D;
    var type : ConnectorType;

    public function new(x : Float, y : Float, radius : Float, context : CanvasRenderingContext2D, connType : ConnectorType, port : Port) {
        pos = new Vector2D(x, y);
        this.radius = radius;
        ctx = context;
        type = connType;

        this.port = port;
    }

    public function render() : Void {
        if( type == ConnectorType.Input ) {
            ctx.fillStyle = "rgb(87, 158, 25)";
        } else {
            ctx.fillStyle = "rgb(191, 73, 43)";
        }
        ctx.beginPath();
        ctx.arc(pos.x, pos.y, radius, 0, Math.PI*2);
        ctx.fill();
    }


}
