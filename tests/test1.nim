import unittest
import ../src/nimadtst
import os

test "dir and file created":
  check fileExists("tests/test1.nim") == true
