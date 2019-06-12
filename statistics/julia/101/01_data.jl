# https://docs.julialang.org/en/v1/manual/getting-started/
using Printf

# use Printf.@printf
@printf("------ %s ------\n", "variable test")

@printf("-----variable is able to assign other type-----\n")
x = 1
println(x + x)
x = 1.0
println(x - 2 )
@printf("x=%.1f y=3x-1 -> y=%.1f \n", x ,3x -1)

@printf("-----multibyte variable is able to define.-----\n")
λ = 20.5234
@printf("λ=%.3f \n", λ)

@printf("-----typecast-----\n")

str_num = "2.56789"
@printf("string'%s' to Float64(.3f)->%.3f \n", str_num, parse(Float64, str_num))

str_num = "127"
@printf("string'%s' to Int8->%d \n", str_num, parse(Int8, str_num))

str_num = "2200000000"
@printf("string'%s' to Unsigned Int32->%d \n", str_num, parse(UInt32, str_num))
str_num = "592425464647"
@printf("string'%s' to Int64->%d \n", str_num, parse(Int64, str_num))
_num = 10
@printf("typeof'%d'  ->%s \n", _num, typeof(_num))
_num = 0x20
@printf("typeof'%d'  ->%s \n", _num, typeof(_num))

_num = 80
@printf("route of %d is %.2f \n", _num, sqrt(_num))

_num = 3e10
@printf("e-notation   is %.1e \n", _num)

_num = 2.5e-4
@printf("e-notation   is %.5f \n", _num)

@printf("-----list-----\n")
for i in [1, 13, 4, 7, 13,2,3,  9,  4, 1]
    print(i)
end
println("")

@printf("-----list-----\n")
for i in [1, 13, 4, 7, 13,2,3,  9,  4, 1]
    print(i)
end
println("")

@printf("-----dict-----\n")
dict_a = Dict("alpha" => 1, "beta" =>2)
for i in keys(dict_a)
    print(dict_a[i])
end
println("")
