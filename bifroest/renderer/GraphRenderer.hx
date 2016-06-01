package bifroest.renderer;

import js.html.CanvasRenderingContext2D;
import js.html.CanvasElement;
import js.html.MouseEvent;

import bifroest.utils.Vector2D;
import bifroest.graph.Graph;
import bifroest.graph.Node;

class GraphRenderer {

    var ctx : CanvasRenderingContext2D;
    var canvas : CanvasElement;

    var graph : Graph;
    var nodesRender : Array<DisplayNode>;

    var activeNode : DisplayNode;
    var selectedPos : Vector2D;

    var activePort : DisplayConnector;
    var edges : Array<DisplayEdge>;
    var tmpEdge : TmpDisplayEdge;

    public function new(renderContext : CanvasRenderingContext2D, graph : Graph, canvas : CanvasElement) {
        ctx = renderContext;
        this.canvas = canvas;
        this.graph = graph;
        nodesRender = new Array<DisplayNode>();

        var nodeIntex = 0;
        for( node in graph.nodes ) {
            var tmpx = 100 + 100 * nodeIntex;
            var tmpy = 100;
            var tmpNode = new DisplayNode(tmpx, tmpy, ctx, node);
            nodesRender.push(tmpNode);
            nodeIntex++;
        }

        edges = new Array<DisplayEdge>();

        for( edge in graph.edges ) {
            var tmpOutPort = null;
            var tmpInPort = null;
            for( node in nodesRender ) {
                for( oport in node.outputPorts ) {
                    if( edge.from == oport.port ) {
                        tmpOutPort = oport;
                    }
                }
            }

            for( node in nodesRender ) {
                for( iport in node.inputPorts ) {
                    if( edge.to == iport.port ) {
                        tmpInPort = iport;
                    }
                }
            }

            if (tmpInPort != null && tmpOutPort != null ) {
                edges.push(new DisplayEdge(tmpOutPort, tmpInPort, ctx));
            }
        }


        selectedPos = new Vector2D(0, 0);
    }

    public function renderNodes() : Void {
        for( dpNode in nodesRender ) {
            dpNode.render();
        }

        for( edge in edges ) {
            edge.render();
        }

        if (tmpEdge != null) {
            tmpEdge.render();
        }
    }


    public function selectNode(event : MouseEvent) : Void {
        var mousex = event.pageX;
        var mousey = event.pageY;
        clearActive();
        for( node in nodesRender ) {
            var bounds = node;
            if (InputManager.inBounds(new Vector2D(mousex, mousey), node)) {
                    clearActive();
                    node.active = true;
                    activeNode = node;
            }
        }

    }

    // Node
    public function mouseDown(event : MouseEvent) : Void {
        for( node in nodesRender ) {
            if (InputManager.inBounds(new Vector2D(event.layerX, event.layerY), node)) {
                clearActive();
                node.active = true;
                activeNode = node;

                selectedPos = new Vector2D(event.clientX - node.x, event.clientY - node.y);

                InputManager.registerMove(canvas, mouseMove);
                InputManager.registerUp(canvas, mouseUp);
            }
        }
    }

    public function mouseMove(event : MouseEvent) : Void {
        if ( activeNode != null ) {
            activeNode.x = event.clientX - selectedPos.x;
            activeNode.y = event.clientY - selectedPos.y;
            activeNode.updatePortPosition();
        }
    }

    public function mouseUp(event : MouseEvent) : Void {
        if ( activeNode != null ) {
            InputManager.unregisterMove(canvas, mouseMove);
            InputManager.unregisterUp(canvas, mouseUp);
        }
    }

    function clearActive() : Void {
        for( rNode in nodesRender ) {
            rNode.active = false;
        }
        activeNode = null;
    }

    // Port
    public function portMouseDown(event : MouseEvent) : Void {
        trace(event.clientX, event.clientY);
        trace(event.layerX, event.layerY);
        for( node in nodesRender ) {
            for( port in node.outputPorts ) {
                if (InputManager.inCircle(new Vector2D(event.layerX, event.layerY), port)) {
                    trace("foo");
                    activePort = port;
                    InputManager.registerMove(canvas, portMouseMove);
                    InputManager.registerUp(canvas, portMouseUp);
                }
            }
        }
    }

    public function portMouseMove(event : MouseEvent) : Void {
        trace ("foo");
        if ( activePort != null ) {
            trace("bar");
            tmpEdge = new TmpDisplayEdge(activePort.pos, new Vector2D(event.layerX, event.layerY), ctx);
        }
    }

    public function portMouseUp(event : MouseEvent) : Void {
        if ( activePort != null ) {
            for( node in nodesRender ) {
                for( port in node.inputPorts ) {
                    if (port != activePort && InputManager.inCircle(new Vector2D(event.layerX, event.layerY), port)) {
                        tmpEdge = null;
                        edges.push(new DisplayEdge(activePort, port, ctx));
                        InputManager.unregisterMove(canvas, portMouseMove);
                        InputManager.unregisterUp(canvas, portMouseUp);
                    }
                }
            }
        }
    }

}
