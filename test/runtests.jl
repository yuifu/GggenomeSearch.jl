using Requests
if VERSION < v"0.7-"
    using Base.Test
else
    using Test
end


@test getResponse("https://gggenome.dbcls.jp/mm10/GTGCGGTAACGCGACCGATCCCGGAGAAGCCGGCGGGA.txt") == "# [ GGGenome | 2018-06-30 13:01:46 ]\n# database:\tMouse genome, GRCm38/mm10 (Dec, 2011)\n# query:\tGTGCGGTAACGCGACCGATCCCGGAGAAGCCGGCGGGA\n# count:\t0\n# query:\tTCCCGCCGGCTTCTCCGGGATCGGTCGCGTTACCGCAC\n# count:\t0\n# name\tstrand\tstart\tend\tsnippet\tsnippet_pos\tsnippet_end\n### No items found. ###\n"
@test extractTopResultFromResponse(getResponse("https://gggenome.dbcls.jp/refseq88/GTGCGGTAACGCGACCGATCCCGGAGAAGCCGGCGGGA.txt")) == "NR_003279.1 Mus musculus 28S ribosomal RNA (Rn28s1), ribosomal RNA"
@test generateGggenomeUrl(seq, "mm10", ".json") == "https://gggenome.dbcls.jp/mm10/GTGCGGTAACGCGACCGATCCCGGAGAAGCCGGCGGGA.json"
@test showGggenomeTopHit("GTGCGGTAACGCGACCGATCCCGGAGAAGCCGGCGGGA", "mm10") == "No hit"
@test showGggenomeTopHit("GTGCGGTAACGCGACCGATCCCGGAGAAGCCGGCGGGA", "refseq88") == "NR_003279.1 Mus musculus 28S ribosomal RNA (Rn28s1), ribosomal RNA"

