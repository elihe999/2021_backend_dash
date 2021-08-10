# nose 2

This is demo for nose2 <https://github.com/nose-devs/nose2>

## quick start

```python
# in test_simple.py
import unittest

class TestStrings(unittest.TestCase):
    def test_upper(self):
        self.assertEqual("spam".upper(), "SPAM")
```