package examples.cydeo;

import com.intuit.karate.junit5.Karate;

public class CydeoTestRunner {

    @Karate.Test
    Karate testCydeo() {
        return Karate.run("spartansTests").tags("@wip").relativeTo(getClass());
    }
}
