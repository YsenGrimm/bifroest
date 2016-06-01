package bifroest.utils;

class Rect {

    public var pos : Vector2D;
    public var scale : Vector2D;

    public var x(get, null) : Float;
    public var y(get, null) : Float;
    public var w(get, null) : Float;
    public var h(get, null) : Float;

    public var width(get, null) : Float;
    public var height(get, null) : Float;

    public function new(x : Float, y : Float, w : Float, h : Float) {
        pos = new Vector2D(x, y);
        scale = new Vector2D(w, h);
    }

    function get_x() : Float {
        return pos.x;
    }

    function get_y() : Float {
        return pos.y;
    }

    function get_w() : Float {
        return scale.w;
    }

    function get_h() : Float {
        return scale.w;
    }

    function get_width() : Float {
        return scale.w;
    }

    function get_height() : Float {
        return scale.h;
    }
}
