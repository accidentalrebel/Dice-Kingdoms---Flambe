package game.tools;

import flambe.Entity;
import flambe.script.Action;

/**
 * ...
 * @author Karlo
 */
typedef FunctionToCall2<A,B> = A -> B -> Void;
 
class CallFunction2<A,B>
	implements Action
{
    /**
     * @param fn The function to call when this action is run.
     */
    public function new (fn :FunctionToCall2<A,B>, arg1 : Dynamic, arg2 : Dynamic)
    {
        _fn = fn;
		_arg1 = arg1;
		_arg2 = arg2;
    }

    public function update (dt :Float, actor :Entity)
    {
        _fn(_arg1, _arg2);
        return 0;
    }

    private var _fn :FunctionToCall2<A,B>;
	private var _arg1 :Dynamic;
	private var _arg2 :Dynamic;
}
