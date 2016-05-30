package bifroest.utils;

class Vector2D {

        public var x : Float;
        public var y : Float;

        public var w(get, null) : Float;
        public var h(get, null) : Float;

        public function new(x : Float, y : Float) {
            this.x = x;
            this.y = y;
        }

        public static function Zero() : Vector2D {
            return new Vector2D(0, 0);
        }

        public function addVec(v : Vector2D) : Vector2D {
            var x = this.x + v.x;
            var y = this.y + v.y;
            return new Vector2D(x, y);
        }

        public function addScalar(s : Float) : Vector2D {
            var x = this.x + s;
            var y = this.y + s;
            return new Vector2D(x, y);
        }

        public function subVec(v) : Vector2D {
            var x = this.x - v.x;
            var y = this.y - v.y;
            return new Vector2D(x, y);
        }

        public function subSkalar(s) : Vector2D {
            var x = this.x - s;
            var y = this.y - s;
            return new Vector2D(x, y);
        }

        public function divSkalar(d) : Vector2D {
            var x = this.x / d;
            var y = this.y / d;
            return new Vector2D(x, y);
        }

        public function multSkalar(s) : Vector2D {
            var x = this.x * s;
            var y = this.y * s;
            return new Vector2D(x, y);
        }

        public function toString() : String {
            return "[ " + x + ", " + y + " ]";
        }

        public function norm() : Float {
            return Math.sqrt(x*x + y*y);
        }

        function get_w() : Float {
            return x;
        }

        function get_h() : Float {
            return y;
        }
}
