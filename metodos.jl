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
  h = (tₙ - t₀) / n
  t = linspace(t₀, tₙ, n + 1)
  y = zeros(n + 1)
  α = β = 0.5
  δ = γ = 1.0
  y[1] = y₀
  for k = 1:n
    k₁ = f(t[k], y[k])
    k₂ = f(t[k] + δ * h, y[k] + γ * h * k₁)
    y[k + 1] = y[k] + h * (α * k₁ + β * k₂)
  end
  return t, y
end

function heun(f, t₀, y₀, tₙ; n = 100)
  h = (tₙ - t₀) / n
  t = linspace(t₀, tₙ, n + 1)
  y = zeros(n + 1)
  α = 0.25
  β = 0.75
  δ = γ = 2.0/3.0
  y[1] = y₀
  for k = 1:n
    k₁ = f(t[k], y[k])
    k₂ = f(t[k] + δ * h, y[k] + γ * h * k₁)
    y[k + 1] = y[k] + h * (α * k₁ + β * k₂)
  end
  return t, y
end

function midpoint(f, t₀, y₀, tₙ; n = 100)
  h = (tₙ - t₀) / n
  t = linspace(t₀, tₙ, n + 1)
  y = zeros(n + 1)
  α = 0.0
  β = 1.0
  δ = γ = 0.5
  y[1] = y₀
  for k = 1:n
    k₁ = f(t[k], y[k])
    k₂ = f(t[k] + δ * h, y[k] + γ * h * k₁)
    y[k + 1] = y[k] + h * (α * k₁ + β * k₂)
  end
  return t, y
end

function rungekutta4(f, t₀, y₀, tₙ; n = 100)
  h = (tₙ - t₀) / n
  t = linspace(t₀, tₙ, n + 1)
  y = zeros(n + 1)
  y[1] = y₀
  for k = 1:n
    k₁ = f(t[k], y[k])
    k₂ = f(t[k] + 0.5 * h, y[k] + 0.5 * h * k₁)
    k₃ = f(t[k] + 0.5 * h, y[k] + 0.5 * h * k₂)
    k₄ = f(t[k] + h, y[k] + h * k₃)
    y[k + 1] = y[k] + h * (k₁ + 2.0 * k₂ + 2.0 * k₃ + k₄) / 6.0
  end
  return t, y
end
