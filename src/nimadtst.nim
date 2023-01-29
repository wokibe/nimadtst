# after "nimble init <dir>" add a skeleton for unittest:
#   create a tests directory
#   add a config.nims file
#   add a test1.nim template file
# kittekat jan/2021

import strformat, os

when isMainModule:
  if paramCount() < 1:
    echo("Usage: nimadtst <dir>")
    echo("  where <dir> is the destination directory (as in 'nimble init dir')")
    quit(1)
  let destDir = paramStr(1)
  if not dirExists(destDir):
    echo("Destination dir: {destDir} must exist".fmt)
    quit(1)
  os.setCurrentDir(destDir)
  discard existsOrCreateDir("tests")
  os.setCurrentDir("tests")

  let confFile = "config.nims"
  var confData = "switch(\"path\", \"$projectDir/../src\")"
  if not fileExists(confFile):
    writeFile(confFile, confData)

  let testFile = "test1.nim"
  var testData = "import unittest\n"
  testData &= "import ../src/{destDir}\n".fmt
  testData &= "\n"
  testData &= "test \"tst1\":\n"
  testData &= "  check true == false\n"
  if not fileExists(testFile):
    writeFile(testFile, testData)
