using GggenomeSearch

function post_query_line_by_line(ifile, ofile)
	mkpath(dirname(ofile))

	ln = ""
	x = ""
	seq = ""

	open(ofile, "w") do fw
		open(ifile) do f
			# Header
			ln = readline(f)
			x = chomp(ln) * "\tgggenome_mm10\tgggenome_refseq88"
			write(fw, x * "\n")

			for ln in eachline(f)
				seq = split(chomp(ln), "\t")[2]
				x = chomp(ln)
				println("Request...")
				x *= "\t" * showGggenomeTopHit(seq, "mm10")
				sleep(1)
				println("Request...")
				x *= "\t" * showGggenomeTopHit(seq, "refseq88")
				sleep(1)
				write(fw, x * "\n")
			end
		end
	end
end

###################
