### A Pluto.jl notebook ###
# v0.18.0

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ fd3f0e53-a7c1-4444-b61d-8da3030c1aaf
import Pkg; Pkg.add("PlutoUI")

# ╔═╡ f68012e7-6041-41f6-be12-e9970a0b1843
using PlutoUI

# ╔═╡ 67883880-9a29-11ec-2184-a165b7fd2fb8
md"""## A simple biodiversity/entropy example in Julia
By moving the first slider you define the number of animals in the biome, then you can move the other sliders to define the number of individuals per specied, and a the bottom you see the computaion of the Shannon diversity index, with output in LaTeX.

By clicking at the eye left to the cells, you can unfold the Julia source code.
"""

# ╔═╡ 1c5444c3-1a92-43c2-aa87-9af05e6e83b8
import PlutoUI: combine

# ╔═╡ 7fad930b-ab16-4c3c-b980-02a90815f3a1
speciess = ("rabbits", "foxes", "bears", "eagles");

# ╔═╡ 50a29af8-99d3-4c48-8d66-d461322b4c00
md"""Number of species:
$(@bind N Slider(1:length(speciess), show_value=true))
"""

# ╔═╡ c1993ca1-375a-44bd-8e06-03af9dfef291
function animal_nrs(species_names)
	combine() do Child
		inputs = [
			md""" $(name): $(
				Child(name, Slider(0:5, show_value=true))
			)"""
			for name in species_names
		]
	
		md"""$(inputs)"""
	end
end;

# ╔═╡ 4363e4b2-dd0b-4291-8083-a938a804e1a6
@bind animals animal_nrs(speciess[1:N])

# ╔═╡ 7d16bcde-0238-4860-9354-77224829c4ea
begin
	# a log function that returns 0 for p == 0
	mylog(p) = p == 0 ? 0 : log(p)
 
	function SDI(ns; digits=5)
		N = sum(ns)
		if N == 0
			return 0
		end
		ps = ns ./ N
		return round(-sum(ps.*mylog.(ps)), digits=digits)
	end
end;

# ╔═╡ 6ab66e79-46eb-4133-8fbf-11def7d48de8
begin
	s = """\$\\begin{align}\\hbox{SDI} &= -\\sum\\limits_{i=1}^{N} p_i\\,\\log(p_i)\\\\"""

	if sum(values(animals)) > 0
		s*= "&="
		for k in 1:N
			num = values(animals)[k]
			den = sum(values(animals))
			if num != 0
				s *= "-\\frac{$(num)}{$(den)} \\,\\log\\left(\\frac{$(num)}{$(den)}\\right)"
			end
		end
		s *= "\\\\"

		s*= "&="
		for k in 1:N
			p = round(values(animals)[k] / sum(values(animals)), digits=2)
			if p != 0.0 
				s *= "-$p \\,\\log($p)"
			end
		end
		s *= "\\\\"
	
	end
	s *= """&= $(SDI(values(animals)))"""
	s *= """\\end{align}\$"""
	Markdown.parse(s)
end

# ╔═╡ Cell order:
# ╟─67883880-9a29-11ec-2184-a165b7fd2fb8
# ╟─fd3f0e53-a7c1-4444-b61d-8da3030c1aaf
# ╟─1c5444c3-1a92-43c2-aa87-9af05e6e83b8
# ╟─f68012e7-6041-41f6-be12-e9970a0b1843
# ╟─7fad930b-ab16-4c3c-b980-02a90815f3a1
# ╟─50a29af8-99d3-4c48-8d66-d461322b4c00
# ╟─c1993ca1-375a-44bd-8e06-03af9dfef291
# ╟─4363e4b2-dd0b-4291-8083-a938a804e1a6
# ╟─7d16bcde-0238-4860-9354-77224829c4ea
# ╟─6ab66e79-46eb-4133-8fbf-11def7d48de8
