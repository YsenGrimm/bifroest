package bifroest;

interface Filter
{
    public function input(input : Dynamic) : Void;

    public function output() : Dynamic;
}
