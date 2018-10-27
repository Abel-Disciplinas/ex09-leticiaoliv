function euler(f, t₀, y₀, tₙ; n = 100)
  h = (tₙ - t₀) / n
  t = linspace(t₀, tₙ, n + 1)
  y = zeros(n + 1)
  y[1] = y₀
  for i = 1:n
    y[i+1] = y[i] + h * f(t[i], y[i])
  end
  return t, y
end

function euler_aperfeicoado(f, t₀, y₀, tₙ; n = 100)
  # Implemente
end

function heun(f, t₀, y₀, tₙ; n = 100)
  # Implemente
end

function midpoint(f, t₀, y₀, tₙ; n = 100)
  # Implemente
end

function rungekutta4(f, t₀, y₀, tₙ; n = 100)
  # Implemente
end
