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
		// The first assignment is OK.
		foo.assign(true);
		// By `@:forward` metadata, can be used like the underlying type.
		trace(foo == true);
		
		// After the second time, runtime error.
		foo.assign(false);
	}
}
```

## Tips: When public, Prevent assignment from outside the class
```haxe
final _foo:Immutable<Bool> = new Immutable();
public var foo(get, never):Bool;
inline function get_foo():Bool {
	return _foo;
}
```
or
```haxe
final foo:Immutable<Bool> = new Immutable();
public inline function getFoo():Bool {
	return foo;
}
```
