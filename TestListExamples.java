import static org.junit.Assert.*;
import org.junit.*;
import java.util.ArrayList;
import java.util.List;


public class TestListExamples {
  // Write your grading tests here!
  @Test
  public void testFilter(){
    StringChecker sc = (String s) -> !s.isEmpty();
    ArrayList<String> input =  new ArrayList<String>();
    input.add("a");
    input.add("b");
    input.add("");
    ArrayList<String>output =input;
    Assert.assertEquals(output, ListExamples.filter(input, sc));
    output.remove("");
    //assertArrayEquals(output.toArray(),ListExamples.filter(input,sc).toArray());
  }

  @Test
  public void testMerge(){
    ArrayList<String> input1 = new ArrayList<>(Arrays.asList("a"));
    ArrayList<String> input2 = new ArrayList<>(Arrays.asList("b", "c", "d"));
    ArrayList<String> output = new ArrayList<>(Arrays.asList("a", "b", "c", "d"));
    Assert.assertEquals(output, ListExamples.merge(input1, input2));
  }

}
