package wing;

import wing.Immutable.AlreadyAssignError;
import utest.Assert;
import haxe.io.Path;
import utest.ITest;
using Safety;

class TestImmutable implements ITest {
	public function new() {}

	public function testObject():Void {
		final immutable:Immutable<Path> = new Immutable();
		Assert.isTrue(immutable == null);
		final pathA:Path = new Path("a");
		immutable.assign(pathA);
		Assert.isTrue(immutable != null);
		Assert.isTrue(immutable == pathA);
		try {
			immutable.assign(new Path("b"));
			Assert.fail("Error must occur");
		} catch (e:AlreadyAssignError) {
			Assert.pass();
		}
	}

	public function testExample():Void {
		Assert.isTrue(new Foo().foo.sure());
	}
}

class Foo {
	final _foo:Immutable<Bool> = new Immutable();
	public var foo(get, never):Null<Bool>;
	inline function get_foo():Null<Bool> {
		return _foo;
	}

	public function new() {
		setup();
	}

	function setup():Void {
		// The first assignment is OK.
		_foo.assign(true);
		// By `@:forward` metadata, can be used like the underlying type.
		trace(_foo == true);
		// Usually use this after assignment.
		trace(foo == true);

		// After the second time, runtime error.
		try {
			_foo.assign(false);
			Assert.fail("Error must occur");
		} catch (e:AlreadyAssignError) {
			Assert.pass();
		}
	}
}
