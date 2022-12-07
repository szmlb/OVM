using PyPlot
using Formatting
using Printf
using LinearAlgebra

function plot_nonlinopt_result(plotting_num, xlim, ylim, x_history, x_error, f_obs)

# 最適化する関数のコンター図の準備
n=plotting_num
x1 = range(xlim[1], stop=xlim[2], length=n)
x2 = range(ylim[1], stop=ylim[2], length=n)
x1grid = repeat(x1', n, 1)
x2grid = repeat(x2, 1, n)

z = zeros(n, n)
for i in 1:n
for j in 1:n
z[i, j] = f_obs([x1[j], x2[i]])
end
end

# 解の点列の準備
x1_scatter = x_history[1, :]
x2_scatter = x_history[2, :]

# 全部プロット
fig = figure(figsize=(10, 5))
ax = fig.add_subplot(1, 2, 1)
PyPlot.contour(x1grid, x2grid, z, colors="black", linewidth=1.0)
PyPlot.plot(x1_scatter, x2_scatter, marker="o", linestyle="-")
PyPlot.title("Contour Plot")
ax = fig.add_subplot(1, 2, 2)
PyPlot.semilogy(1:length(x_history[1, :]), x_error, marker="o", linestyle="-")
PyPlot.title("Learning rate")
PyPlot.show()

end
