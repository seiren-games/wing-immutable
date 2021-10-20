# wing-immutable
Make a variable immutable.
Raise a runtime error on reassignment.

Normally if it is `final`, it must be assigned in the constructor.  
The purpose is to allow the first assignment in other functions.  

# Usage
```haxe
class Foo {
	final foo:Immutable<Bool> = new Immutable();

	public function new() {
		setup();
	}
	
	function setup():Void {
		foo.assign(true); // The first assignment is OK.
		trace(foo == true); // By `@:forward` metadata, can be used like the underlying type.
		foo.assign(false); // After the second time, runtime error.
	}
}
```