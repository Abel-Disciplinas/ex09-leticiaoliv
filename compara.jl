using Plots
gr(size=(600,600))
default(fmt=:png)

include("metodos.jl")

function compara()
  f(t, y) = exp(-t) - y
  t₀, y₀, tₙ = 0.0, 0.0, 4.0
  sol(t) = t * exp(-t)
  mtds = [euler, euler_aperfeicoado, heun, midpoint, rungekutta4]

  for n = [2; 5; 10; 100; 1000]
    plot(sol, t₀, tₙ, c=:black, lab="Sol", leg=:topright)
    for mtd in mtds
      t, y = mtd(f, t₀, y₀, tₙ, n = n)
      plot!(t, y, lab="$mtd")
    end
    title!("n = $n")
    name = @sprintf("compara-%04d", n)
    png(name)
  end

  Ns = 2.^(2:12)
  E = zeros(length(mtds), length(Ns))
  Ef = zeros(length(mtds), length(Ns))
  for (j,n) = enumerate(Ns)
    for (i,mtd) in enumerate(mtds)
      t, y = mtd(f, t₀, y₀, tₙ, n = n)
      ysol = sol.(t)
      E[i,j] = norm(y - ysol) / n
      Ef[i,j] = abs(y[end] - ysol[end])
    end
  end

  plot(yaxis=:log, xaxis=:log)
  for i = 1:length(mtds)
    plot!(Ns, E[i,:], lab="$(mtds[i])")
  end
  png("erros")

  plot(yaxis=:log, xaxis=:log)
  for i = 1:length(mtds)
    plot!(Ns, Ef[i,:], lab="$(mtds[i])")
  end
  png("erros-final")

end

compara()
