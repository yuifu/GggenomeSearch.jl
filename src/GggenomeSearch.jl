__precompile__()

module GggenomeSearch


export
	getResponse,
	generateGggenomeUrl,
	extractTopResultFromResponse,
	showGggenomeTopHit


using Requests


function getResponse(url::String)
    res = get(url)
	return(String(res.data))
end

function generateGggenomeUrl(seq::AbstractString, db::String, format::String)
	return(@sprintf "https://gggenome.dbcls.jp/%s/%s%s" db seq format)
end

function extractTopResultFromResponse(res_str::String)
	topResult = "No hit"
	for ln in split(chomp(res_str), "\n")
		if ln[1] == '#'
			continue
		else
			topResult = split(chomp(ln), "\t")[1]
			break
		end
	end
	return(topResult)
end

function showGggenomeTopHit(seq::AbstractString, db::String)
	url = generateGggenomeUrl(seq, db, ".txt")
	res_str = getResponse(url)
	return(extractTopResultFromResponse(res_str))
end


end # module
