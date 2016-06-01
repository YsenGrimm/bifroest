package bifroest.renderer;

import js.Browser;
import js.html.Element;
import js.html.MouseEvent;

import bifroest.utils.Vector2D;
import bifroest.utils.Rect;

class InputManager {

    var browser : Browser;

    public function new(browser : Browser) {
        this.browser = browser;
    }

    public static function registerClick(element : Element, listener : MouseEvent -> Void) : Void {
        element.addEventListener("click", listener, false);
    }

    public static function registerDown(element: Element, listener : MouseEvent -> Void) : Void {
        element.addEventListener("mousedown", listener, false);
    }

    public static function unregisterDown(element: Element, listener : MouseEvent -> Void) : Void {
        element.removeEventListener("mousedown", listener, false);
    }

    public static function registerMove(element: Element, listener : MouseEvent -> Void) : Void {
        element.addEventListener("mousemove", listener, false);
    }

    public static function unregisterMove(element: Element, listener : MouseEvent -> Void) : Void {
        element.removeEventListener("mousemove", listener, false);
    }

    public static function registerUp(element: Element, listener : MouseEvent -> Void) : Void {
        element.addEventListener("mouseup", listener, false);
    }

    public static function unregisterUp(element: Element, listener : MouseEvent -> Void) : Void {
        element.removeEventListener("mouseup", listener, false);
    }

    public static function inBounds(mouse : Vector2D, node : DisplayNode) : Bool {
        return (((mouse.x > node.x && mouse.x < (node.x + node.width)) &&
            (mouse.y > node.y && mouse.y < (node.y + node.height))));
    }

    public static function inCircle(mouse : Vector2D, connector : DisplayConnector) : Bool {
        return (connector.pos.subVec(mouse).norm() <= connector.radius);
    }
}
