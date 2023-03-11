"""
Sample tests
"""

from django.test import SimpleTestCase

from app import calc  # type: ignore


class CalcTests(SimpleTestCase):
    """Test calcu module"""

    def test_add_numbers(self):
        res = calc.add(5, 6)

        self.assertEqual(res, 11)

    def test_subtract_number(self):
        """test subtracting number"""
        res = calc.subtract(10, 15)

        self.assertEqual(res, 5)
