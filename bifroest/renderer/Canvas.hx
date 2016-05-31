package bifroest.renderer;

import js.html.HTMLDocument;
import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;
import js.Browser;

import bifroest.utils.Vector2D;
import bifroest.graph.Graph;

class Canvas
{
    public var canvas : CanvasElement;
    var ctx : CanvasRenderingContext2D;
    var size : Vector2D;
    var graphRender : GraphRenderer;

    public function new(size : Vector2D, graph : Graph)
    {
        this.canvas = Browser.document.createCanvasElement();
        this.canvas.width = Std.int(size.w);
        this.canvas.height = Std.int(size.h);
        ctx = canvas.getContext2d();
        this.size = size;
        graphRender = new GraphRenderer(ctx, graph);

        init();
    }

    public function init() : Void {
        render();
    }

    public function render() : Void {
        ctx.fillStyle = "rgb(55, 55, 55)";
        ctx.fillRect(0, 0, size.w, size.h);
    }
}
