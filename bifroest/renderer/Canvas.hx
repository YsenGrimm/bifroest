package bifroest.renderer;

import js.html.HTMLDocument;
import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;
import js.html.Window;
import js.Browser;

import bifroest.utils.Vector2D;
import bifroest.graph.Graph;

class Canvas
{
    public var canvas : CanvasElement;
    var ctx : CanvasRenderingContext2D;
    var size : Vector2D;
    var graphRender : GraphRenderer;
    var window : Window;

    public function new(size : Vector2D, graph : Graph)
    {
        canvas = Browser.document.createCanvasElement();
        canvas.width = Std.int(size.w);
        canvas.height = Std.int(size.h);
        ctx = canvas.getContext2d();
        this.size = size;

        graphRender = new GraphRenderer(ctx, graph, canvas);

        window = Browser.window;

        InputManager.registerClick(this.canvas, graphRender.selectNode);
        InputManager.registerDown(this.canvas, graphRender.mouseDown);

        InputManager.registerDown(this.canvas, graphRender.portMouseDown);

        init();
    }

    public function init() : Void {
        window.requestAnimationFrame(render);
    }

    public function render(elapsedTime : Float) : Void {
        ctx.fillStyle = "rgb(55, 55, 55)";
        ctx.fillRect(0, 0, size.w, size.h);
        graphRender.renderNodes();

        window.requestAnimationFrame(render);
    }
}
