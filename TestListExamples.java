import static org.junit.Assert.*;
import org.junit.*;
import java.util.ArrayList;
import java.util.List;


public class TestListExamples {
  // Write your grading tests here!
  @Test(timeout = 4000)
  public void testFilter() {
    StringChecker nonempty = (String s) -> !s.isEmpty();
    ArrayList<String> input1 = new ArrayList<String>();
    Assert.assertEquals(input1, ListExamples.filter(input1, nonempty));
    input1.add("a");
    Assert.assertEquals(input1, ListExamples.filter(input1, nonempty));
    input1.add("b");
    Assert.assertEquals(input1, ListExamples.filter(input1, nonempty));
    input1.add("");
    Assert.assertEquals(
        new ArrayList<String>(Arrays.asList("a", "b")), ListExamples.filter(input1, nonempty));
  }

  @Test(timeout = 4000)
  public void testMerge() {
    ArrayList<String> input1 = new ArrayList<>(Arrays.asList("a"));
    ArrayList<String> input2 = new ArrayList<>(Arrays.asList("b", "c", "d"));
    ArrayList<String> test = new ArrayList<>(Arrays.asList("a", "b", "c", "d"));
    Assert.assertEquals(test, ListExamples.merge(input1, input2));
    input1 = new ArrayList<>(Arrays.asList("a", "b", "c"));
    input2 = new ArrayList<>(Arrays.asList("d"));
    test = new ArrayList<>(Arrays.asList("a", "b", "c", "d"));
    Assert.assertEquals(test, ListExamples.merge(input1, input2));
    Assert.assertEquals(
        new ArrayList<String>(), ListExamples.merge(new ArrayList<>(), new ArrayList<>()));
  }
  /* 
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
*/
}
