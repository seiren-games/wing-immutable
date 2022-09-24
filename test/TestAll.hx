import utest.Runner;
import utest.ui.Report;
import wing.*;

class TestAll {
	public static function main():Void {
		final runner:Runner = new Runner();
		runner.addCase(new TestImmutable());
		Report.create(runner);
		runner.run();
	}
}
