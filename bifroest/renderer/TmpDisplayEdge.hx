package bifroest.renderer;

import js.html.CanvasRenderingContext2D;

import bifroest.utils.Vector2D;

class TmpDisplayEdge {

    public var fromPos : Vector2D;
    public var toPos : Vector2D;

    var ctx : CanvasRenderingContext2D;

    public function new(from : Vector2D, to : Vector2D, ctx : CanvasRenderingContext2D) {

        fromPos = from;
        toPos = to;

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
