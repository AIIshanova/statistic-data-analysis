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

typeof(3)

typeof(3.5)

typeof(3/3.5)

typeof(sqrt(3+4im))

typeof(pi)

1.0/0.0, 1.0/(-0.0), 0.0/0.0

typeof(1.0/0.0), typeof(1.0/(-0.0)), typeof(0.0/0.0)

for T in
    [Int8,Int16,Int32,Int64,Int128,UInt8,UInt16,UInt32,UInt64,UInt128]
    println("$(lpad(T,7)): [$(typemin(T)),$(typemax(T))]")
end

Int64(2.0)

Char(2)

convert(Int64, 2.0)

convert(Char, 2)

Bool(1)

Bool(0)

promote(Int8(1), Float16(4.5), Float32(4.1))

typeof(promote(Int8(1), Float16(4.5), Float32(4.1)))

function f(x)
    x^2
end

f(4)

g(x)=x^2

g(8)

a = [4 7 6] # вектор-строка
b = [1, 2, 3] # вектор-столбец
a[2], b[2] # вторые элементы векторов a и b

a = 1; b = 2; c = 3; d = 4 # присвоение значений
Am=[a b; c d]#матрица2х2

Am[1,1], Am[1,2], Am[2,1], Am[2,2] # элементы матрицы

aa = [1 2]
AA = [1 2; 3 4]
aa*AA*aa'

aa, AA, aa'

?read()

io = IOBuffer("Good night");
read(io, String)

?readline()

readline("text.txt")

?readlines()

readlines("text.txt")

using DelimitedFiles

?readdlm()

readdlm("text.txt", '\t', String, '\n')

# +
x = [1; 2; 3; 4];
y = [5; 6; 7; 8];

open("delim_file.txt", "w") do io
    writedlm(io, [x y])
end

readdlm("delim_file.txt", '\t', Int, '\n')
# -

?print()

print("Hi <3")

?println()

println("How are you?", "Good")

?show()

show("<3")

?write()

# +
open("text2.txt", "w") do io
    write(io, "qwerty")
end

readlines("text2.txt")
# -

?parse()

parse(Int64, "8")

typeof(parse(Int64, "8"))

parse(Int, "f", base=16)

# + tags=[]
#int

1+2, 1-2, 1*2, 1/2, 2^2, sqrt(4), 1>2, 1<2, 1==2, 1>=2, 1<=2, 1!=2, (1>2) && (2<3), (1>2) || (2<3)
# -

#float
1.0+2.1, 1.1-2.1, 1.1*2.1, 1.1/2.1, 2.1^2, sqrt(4.1), 1.1>2.1, 1.1<2.1, 1.1==2.1, 1.1>=2.1,
1.1<=2.1, 1.1!=2.1, (1.1>2.1) && (2.1<3.1), (1.1>2.1) || (2.1<3.1)

#complex
1+2im, 1+2im-1im, 1im*1im, (1+2im)/2, (1im)^2, sqrt(1+2im), 1+2im==5+1im, 1+2im!=5+1im, (1+2im==5+1im) && (1im==1im),
(1+2im==5+1im) || (1im==1im)

#rational
1//2+1//3, 1//2-1//3, 1//2*1//3, 1//2 / 3, (1//2)^2, 1//2 < 1//3, 1//2 <= 1//3, 1//2 > 1//3,
1//2 >= 1//3, 1//2 == 1//3, 1//2 != 1//3, (1//2>1//3) && (1//4 < 1//5), (1//2>1//3) || (1//4 < 1//5)

# +
#irrational
using IrrationalExpressions

pi+2*pi, pi-2*pi, pi*pi, pi /2, sqrt(pi), pi < 2*pi, pi <= 2*pi, pi > 2*pi, pi >= 2*pi, pi == 2*pi,
pi != 2*pi, (pi < 2*pi) && (pi < pi/7), (pi < 2*pi) || (pi < pi/7)

# +
#векторы

a = [1; 2]
b = [3; 4]

using LinearAlgebra

a .+ b, a .- b, dot(a,b), a ⋅ b, a', a*2

# +
#матрицы

A = [1 2; 3 4]
B = [3 1; 2 4]

A + B, A - B, dot(A,B), A', A*2
# -


