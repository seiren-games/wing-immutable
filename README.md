# wing-immutable
Make a variable immutable.  
Raise a runtime error on reassignment.

Normally if it is final field, it must be assigned in the constructor.  
The purpose is to allow the first assignment in other functions.  

# Usage
```haxe
import wing.Immutable;

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

## Tips: When public, prevent assignment from outside the class
```haxe
final _foo:Immutable<Bool> = new Immutable();
public var foo(get, never):Null<Bool>;
inline function get_foo():Null<Bool> {
	return _foo;
}
```
or
```haxe
final foo:Immutable<Bool> = new Immutable();
public inline function getFoo():Null<Bool> {
	return foo;
}
```
