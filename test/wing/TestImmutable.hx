package wing;

import wing.Immutable.AlreadyAssignError;
import utest.Assert;
import haxe.io.Path;
import utest.ITest;

class TestImmutable implements ITest {
	public function new() {}

	public function test():Void {
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
}
