package ;

import js.Browser;

import bifroest.renderer.Canvas;
import bifroest.utils.Vector2D;
import bifroest.graph.Node;
import bifroest.graph.Graph;

import bifroest.graph.nodes.TraceNode;
import bifroest.graph.nodes.ScalarNode;
import bifroest.graph.nodes.SumNode;

class Bifroest {

    public static function main()
    {
        var graph = new Graph();
        graph.addNode("Scalar40", new ScalarNode(40));
        graph.addNode("Scalar2", new ScalarNode(2));
        graph.addNode("Trace", new TraceNode());
        graph.addNode("Sum", new SumNode());

        graph.addEdge("Scalar40", "out", "Sum", "A");
        graph.addEdge("Scalar2", "out", "Sum", "B");
        graph.addEdge("Sum", "out", "Trace", "in");

        var canvasRender = new Canvas(new Vector2D(800, 600), graph);
        Browser.document.body.appendChild(canvasRender.canvas);
    }
}
