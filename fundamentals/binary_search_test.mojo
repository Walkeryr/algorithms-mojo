from testing import assert_true
from binary_search import rank

def test_binary_search():
    assert_true(rank(3, List[Int](1, 2, 3, 4, 5)) == 2)       # key in the middle
    assert_true(rank(1, List[Int](1, 2, 3, 4, 5)) == 0)       # key at the beginning
    assert_true(rank(5, List[Int](1, 2, 3, 4, 5)) == 4)       # key at the end
    assert_true(rank(6, List[Int](1, 2, 3, 4, 5)) == -1)      # key not present
    assert_true(rank(3, List[Int]()) == -1)                   # empty array
    assert_true(rank(3, List[Int](3)) == 0)                   # single element array where key is present
    assert_true(rank(4, List[Int](3)) == -1)                  # single element array where key is not present
    assert_true(rank(3, List[Int](1, 2, 3, 3, 3, 4, 5)) == 3) # key with duplicates
