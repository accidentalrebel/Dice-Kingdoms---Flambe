package game.tools;

import flambe.Entity;
import flambe.script.Action;

/**
 * ...
 * @author Karlo
 */
typedef FunctionToCall1<A> = A -> Void;
 
class CallFunction1<A>
	implements Action
{
    /**
     * @param fn The function to call when this action is run.
     */
    public function new (fn :FunctionToCall1<A>, arg1 : Dynamic)
    {
        _fn = fn;
		_arg1 = arg1;
    }

    public function update (dt :Float, actor :Entity)
    {
        _fn(_arg1);
        return 0;
    }

    private var _fn :FunctionToCall1<A>;
	private var _arg1 :Dynamic;
}
