package wing;

import wing.Immutable.AlreadyAssignError;
import utest.Assert;
import haxe.io.Path;
import utest.ITest;

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
		new Foo();
	}
}

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
		try {
			foo.assign(false);
			Assert.fail("Error must occur");
		} catch (e:AlreadyAssignError) {
			Assert.pass();
		}
	}
}
