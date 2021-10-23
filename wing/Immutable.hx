package wing;

import haxe.Exception;

/**
 * The variable is assigned only once.  
 * Declare as `final` or `never`.  
 */
@:forward
abstract Immutable<T>(Null<T>) to Null<T> {
	public inline function new(?value:Null<T>) {
		this = value;
	}

	/**
	 * Can only be assigned once if the value is null.
	 */
	// Unfortunately, Assignment overloading is not supported
	// @:op(A = B)
	public inline function assign(value:T):T {
		if (this != null) {
			@:nullSafety(Off)
			throw new AlreadyAssignError("Cannot assign `" + value + "`, `" + this + "` is already assigned.");
		}
		return this = value;
	}
}

class AlreadyAssignError extends Exception {}
