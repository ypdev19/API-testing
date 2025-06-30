import com.intuit.karate.Results;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

/**
 * Runner class to execute Karate test suite.
 *
 */
public class KarateTestsRunner {

    @Test
    void testParallel() {
        Results results = Karate.run("src/test/java/features").parallel(6);
        Assertions.assertTrue(results.getFailCount() == 0, results.getErrorMessages());
    }
}
