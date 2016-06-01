package bifroest.renderer;

import js.html.CanvasRenderingContext2D;

import bifroest.utils.Vector2D;

class DisplayEdge {

    public var fromPos : Vector2D;
    public var toPos : Vector2D;

    public var from : DisplayConnector;
    public var to : DisplayConnector;

    var ctx : CanvasRenderingContext2D;

    public function new(from : DisplayConnector, to : DisplayConnector, ctx : CanvasRenderingContext2D) {
        this.from = from;
        this.to = to;

        fromPos = from.pos;
        toPos = to.pos;

        this.ctx = ctx;
    }

    public function render() : Void {
        ctx.strokeStyle = "rgb(220, 220, 220)";
        ctx.beginPath();
        ctx.moveTo(fromPos.x, fromPos.y);
        ctx.lineTo(toPos.x, toPos.y);
        ctx.stroke();
    }

}
