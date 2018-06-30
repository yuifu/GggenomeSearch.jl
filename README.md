# GggenomeSearch.jl

`GggenomeSearch.jl` is a wrapper for GGGenome written in Julia.

GGGenome (http://gggenome.dbcls.jp/en/) is a ultrafast DNA search service hosted by Database Center for Life Science (DBCLS; https://dbcls.rois.ac.jp/index-en.html).

## Installation

```
Pkg.clone("git://example.com/path/to/Package.jl.git")
```


## Basic usage

```
showGggenomeTopHit(sequence, database_name)
```

- `sequence`: String. A query DNA sequence.
- `database_name`: String. A target database name.
	- List of database names: http://gggenome.dbcls.jp/en/help.html#db_list

### Examples

```
julia> include("refer_gggenome.jl")

julia> seq = "GTGCGGTAACGCGACCGATCCCGGAGAAGCCGGCGGGA"

julia> showGggenomeTopHit(seq, "refseq88")
"NR_003279.1 Mus musculus 28S ribosomal RNA (Rn28s1), ribosomal RNA"

julia> showGggenomeTopHit(seq, "mm10")
"No hit"
```


## Examples of low-layer functions

```
julia> getResponse("https://gggenome.dbcls.jp/mm10/GTGCGGTAACGCGACCGATCCCGGAGAAGCCGGCGGGA.txt")
"# [ GGGenome | 2018-06-30 13:01:46 ]\n# database:\tMouse genome, GRCm38/mm10 (Dec, 2011)\n# query:\tGTGCGGTAACGCGACCGATCCCGGAGAAGCCGGCGGGA\n# count:\t0\n# query:\tTCCCGCCGGCTTCTCCGGGATCGGTCGCGTTACCGCAC\n# count:\t0\n# name\tstrand\tstart\tend\tsnippet\tsnippet_pos\tsnippet_end\n### No items found. ###\n"

julia> extractTopResultFromResponse(getResponse("https://gggenome.dbcls.jp/refseq88/GTGCGGTAACGCGACCGATCCCGGAGAAGCCGGCGGGA.txt"))
"NR_003279.1 Mus musculus 28S ribosomal RNA (Rn28s1), ribosomal RNA"

julia> generateGggenomeUrl(seq, "mm10", ".json")
"https://gggenome.dbcls.jp/mm10/GTGCGGTAACGCGACCGATCCCGGAGAAGCCGGCGGGA.json"
```

- Specification of GGGenome REST API: http://gggenome.dbcls.jp/ja/help.html

## Contact

Haruka Ozaki harukao.cb[at]gmail.com

## License

Copyright (c) [2018] [Haruka Ozaki] This software is released under the MIT License, see LICENSE.
