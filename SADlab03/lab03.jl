# -*- coding: utf-8 -*-
# ---
# jupyter:
#   jupytext:
#     text_representation:
#       extension: .jl
#       format_name: light
#       format_version: '1.5'
#       jupytext_version: 1.14.1
#   kernelspec:
#     display_name: Julia 1.8.2
#     language: julia
#     name: julia-1.8
# ---

# пока n<10 прибавить к n единицу и распечатать значение:
n=0
while n < 10
n += 1
println(n)
end

myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

i=1
while i <= length(myfriends)
    friend = myfriends[i]
    println("Hi $friend, it's great to see you!")
    i += 1
end

for n in 1:2:10
    println(n)
end

myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]
for friend in myfriends
    println("Hi $friend, it's great to see you!")
end

# инициализация массива m x n из нулей:
m, n = 5, 5
A = fill(0, (m, n))

# формирование массива, в котором значение каждой записи
# является суммой индексов строки и столбца:
for i in 1:m
    for j in 1:n
        A[i, j] = i + j
    end
end
A

# инициализация массива m x n из нулей:
B = fill(0, (m, n))
for i in 1:m, j in 1:n
    B[i, j] = i + j
end
B

C = [i + j for i in 1:m, j in 1:n]
C

# используем `&&` для реализации операции "AND"
# операция % вычисляет остаток от деления
N = 15
if (N % 3 == 0) && (N % 5 == 0)
    println("FizzBuzz")
elseif N % 3 == 0
    println("Fizz")
elseif N % 5 == 0
    println("Buzz")
else
    println(N)
end

N = 5
if (N % 3 == 0) && (N % 5 == 0)
    println("FizzBuzz")
elseif N % 3 == 0
    println("Fizz")
elseif N % 5 == 0
    println("Buzz")
else
    println(N)
end

N = 3
if (N % 3 == 0) && (N % 5 == 0)
    println("FizzBuzz")
elseif N % 3 == 0
    println("Fizz")
elseif N % 5 == 0
    println("Buzz")
else
    println(N)
end

N = 1
if (N % 3 == 0) && (N % 5 == 0)
    println("FizzBuzz")
elseif N % 3 == 0
    println("Fizz")
elseif N % 5 == 0
    println("Buzz")
else
    println(N)
end

# Пример использования тернарного оператора:
x=5
y = 10
(x > y) ? x : y

# +
function sayhi(name)
    println("Hi $name, it's great to see you!")
end

# функция возведения в квадрат:
function f(x)
    x^2
end
# -

sayhi("C-3PO")

f(42)

sayhi2(name) = println("Hi $name, it's great to see you!")
f2(x) = x^2

sayhi2("C-3PO")

f2(42)

sayhi3 = name -> println("Hi $name, it's great to see you!")
f3 = x -> x^2

sayhi3("C-3PO")

f3(42)

v = [3, 5, 2]
sort(v)
v

v = [3, 5, 2]
sort!(v)
v

f(x) = x^2
map(f, [1, 2, 3])

x -> x^3
map(x -> x^3, [1, 2, 3])

f(x) = x^2
broadcast(f, [1, 2, 3])

f.([1, 2, 3])

# Задаём матрицу A:
A = [i + 3*j for j in 0:2, i in 1:3]

# Вызываем функцию f возведения в квадрат
f(A)

B = f.(A)

A .+ 2 .* f.(A) ./ A

@. A + 2 * f(A) / A

broadcast(x -> x + 2 * f(x) / x, A)

using Colors
palette = distinguishable_colors(100)

# # rand(palette, 3, 3)

# +
# ЗАДАНИЯ ДЛЯ САМОСТОЯТЕЛЬНОГО ВЫПОЛНЕНИЯ

# +
# 1.

n = 1
while n<=100
    println("$n ", n^2)
    n = n+1
end

# -

# for n in 1:100
#     println("$n ", n^2)
# end

# for n in 1:100
#     println(n, " ", n^2)
# end

squares = Dict()
for i in 1:100
    squares[i] = i^2
end
pairs(squares)

n = 1
while n<=100
    squares[n] = n^2
    n = n+1
end
pairs(squares)

squares_arr = []
for i in 1:100
    append!(squares_arr, i^2)
end
squares_arr

# +
# 2

N = 2
if (N%2==0)
    println(N)
else
    println("нечётное")
end
# -

(N%2==0) ? println(N) : println("нечётное")

# +
# 3

function add_one(x)
    x+1
end

add_one(1)

# +
# 4

A = ones(5,5)
# -

for i in 1:5, j in 1:5
    A[i, j:5] = broadcast(add_one, A[i, j:5])
    if (i!=5 && j==5)
        A[i+1, :] = fill(A[i,5], (1,5))
    end
end
A

# +
# 5

A = [ [1, 5, -2] [1, 2, -1] [3, 6, -3]]
# -

A^3

A[:, 3] = A[:,2]+A[:,3]
A

# +
# 6

B = repeat([10 -10 10], 15)
# -

C = B' * B

# +
# 7

Z = zeros(6,6)
E = ones(6,6)

Z1 = zeros(6,6)

for i in 1:6, j in 1:6
    if (abs(i-j)==1)
        Z1[i,j] = E[i,j]
    end
end
Z1

# + tags=[]
Z2 = zeros(6,6)
for i in 1:6, j in 1:6
    if (abs(i-j)==2 || i==j)
        Z2[i,j] = E[i,j]
    end
end
Z2
# -

Z3 = zeros(6,6)
for i in 1:6, j in 1:6
    if (j == 7-i || j == 5-i || j == 9-i)
        Z3[i,j] = E[i,j]
    end
end
Z3

Z4 = zeros(6,6)
for i in 1:6, j in 1:6
    if (j == i || abs(i-j)==2 || abs(i-j)==4 )
        Z4[i,j] = E[i,j]
    end
end
Z4

#8
function outer(x,y,operation)
    res = zeros(size(x)[1], size(y)[2])
    for i in 1:size(x)[1], j in 1:size(y)[2], k in 1:size(x)[2]
        res[i,j]+=operation(x[i,k],y[k,j])
    end
    return res
end        

aa = collect(0:4)
aa = reshape(aa, (size(aa,1), size(aa,2)))

A1 = outer(aa, aa', +)

A2 = outer(aa, collect(1:5)', ^)

A3 = .%(outer(aa, aa',+),5)

bb = collect(0:9)
bb = reshape(bb, (size(bb,1), size(bb,2)))
A4 = .%(outer(bb, bb',+),10)

# +
cc = collect(0:8)
dd = collect(9:-1:1)
cc = reshape(cc, (size(cc,1), size(cc,2)))
dd = reshape(dd, (size(dd,1), size(dd,2)))

A5 = .%(outer(cc, dd', +),9)

# +
#9

A = [1 2 3 4 5; 2 1 2 3 4; 3 2 1 2 3; 4 3 2 1 2; 5 4 3 2 1]
# -

y = [ 7 -1 -3 5 17]

function solveSLAU(A,y)
    inv(A)*y
end

X = solveSLAU(A,y')

# +
# 10

M = rand(1:10, 6, 10)
# -

N = 4
for i in 1:size(M,1)
    k = 0
for j in 1:size(M,2)
    if (M[i,j] > N)
            k = k+1
    end
    end
    println(i, " ", k )
end

NM = 7
for i in 1:size(M,1)
    if (length(findall(M[i,:] .== NM))==2)
        println(i)
    end
end

K = 75
for i in 1:size(M,1)
    for u in i+1:size(M,1)
        if (sum(M[i,:]+M[u,:]) > K)
            println(i, " ", u)
        end
    end
end

# +
# 11

r1 = 0
for i in 1:20, j in 1:5
    r1 += i^4/(3+j)
end
r1
# -

r2 = 0
for i in 1:20, j in 1:5
    r2 += i^4/(3+i*j)
end
r2
