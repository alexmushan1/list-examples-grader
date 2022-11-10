import static org.junit.Assert.*;
import org.junit.*;
import java.util.ArrayList;
import java.util.List;


public class TestListExamples {
  // Write your grading tests here!
  @Test
  public void testFilter(){
      ArrayList<String> input =  new ArrayList<String>();
      input.add("a");
      input.add("b");
      input.add("longword");
      ArrayList<String>output =input;
      output.remove("longword");
      StringChecker sc = new shortWord();

      assertArrayEquals(output.toArray(),ListExamples.filter(input,sc).toArray());
  }

}
