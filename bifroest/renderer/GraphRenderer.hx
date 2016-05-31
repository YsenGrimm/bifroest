package bifroest.renderer;

import js.html.CanvasRenderingContext2D;

import bifroest.graph.Graph;

class GraphRenderer {

    var ctx : CanvasRenderingContext2D;
    var graph : Graph;

    public function new(renderContext : CanvasRenderingContext2D, graph : Graph) {
        ctx = renderContext;
        this.graph = graph;
    }

    public function renderNodes() : Void {
        for( node in graph.nodes ) {

        }
    }

    function renderNode(node) {

        

    }

}
