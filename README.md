## nimadtst

For a library package "nimble init <name>" adds the skeleton needed for unit tests. But for a binary package this does not happen. "nimadtst <name>" delivers this missing feature.

### Installation

        nimble install nimadtst

### Usage

For a binary package named e.g. "mypack":

        nimble init mypack
        nimadtst mypack

+ creates a tests directory
+ add a config.nims file
+ add a test1.nim boilerplate file

The test1.nim is ready to be edited for the intended tests. Then run: 

        nimble test